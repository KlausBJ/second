# Versions for Environment
class EnvVersion < ApplicationRecord
  # name
  # account
  # description

  include DependencyHandler # split off the relevant subset as PropertyHandler?

  belongs_to :environment, inverse_of: :env_versions
  has_many :properties, as: :owner, dependent: :destroy, inverse_of: :owner
  has_many :instances, dependent: :destroy, inverse_of: :env_version
  has_many :servers, -> { distinct }, through: :instances
  has_many :deploy_plans, dependent: :destroy, inverse_of: :env_version
  has_many :ru_instances, dependent: :destroy, inverse_of: :env_version
  has_many :deploy_logs, inverse_of: :env_version
  has_many :implementations, inverse_of: :env_version
  has_many :deltas, class_name: 'Implementation', foreign_key: :changed_in, inverse_of: :changed_in
  has_many :selections, inverse_of: :env_version
  has_many :dependencies, through: :selections
  belongs_to :env_type, inverse_of: :env_versions
  has_many :credentials, through: :env_type
  has_many :credential_versions,  through: :credentials

  amoeba do
    include_association :properties # dead end
    include_association :instances
    include_association :deploy_plans # hmm, maybe...
    include_association :ru_instances
  end

  # new_ver?
  def next
    new_ver = amoeba_dup
    new_ver.name.succ!
    new_ver.save
    new_ver
  end

  def clone(name)
    new_ver = amoeba_dup
    new_ver.environment = Environment.create name: name
    new_ver.save
    new_ver.instances.each do |inst|
      inst.server.name = 'Copy of ' + inst.server.name
      inst.implementation = Implementation.create(
                                env_version: new_ver,
                                changed_in: new_ver)
      inst.save!
    end
    new_ver.reload
  end

  def env
    environment.name
  end

  def to_s
    environment.name
  end

  def tree
    tree = []
    tree << "#{environment.name}, #{name}"
    properties.each do |prop|
      tree << "Property #{prop.name}: #{prop.content}"
    end
    instances.each do |inst|
      tree << "#{inst.version.deployable.type}: #{inst.version.deployable.name}, #{inst.version.name} #{inst.version.variant} (#{inst.id})"
      inst.properties.each do |iprop|
        tree << "  Property #{iprop.name}: #{iprop.content}"
      end
      tree << "  Implementation: #{inst.implementation.id}"
    end
    tree
  end
end
