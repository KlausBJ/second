# Versions of App
class AppVersion < ApplicationRecord
  include VersionChecker

  belongs_to :app, inverse_of: :app_versions
  has_many :inclusions, as: :entity_version, dependent: :destroy, inverse_of: :app_version
  has_many :variant_mappings, as: :entity_version, dependent: :destroy, inverse_of: :entity_version
  has_many :variants, through: :variant_mappings
  has_many :packages, as: :entity_version, dependent: :destroy, inverse_of: :entity_version
  has_many :scripts, as: :entity_version, dependent: :destroy, inverse_of: :entity_version
  has_many :templates, as: :entity_version, dependent: :destroy, inverse_of: :entity_version
  has_many :properties, as: :owner, dependent: :destroy, inverse_of: :owner
  has_many :dependencies, as: :depender, dependent: :destroy, inverse_of: :depender
  has_many :app_instances, dependent: :destroy, inverse_of: :app_version

  alias_attribute :parent, :app
  alias_attribute :instances, :app_instances

  validate do
    errors.add(:variants, 'Variants/version combination not unique') unless int_ver_unique? version, variant
  end

  amoeba do
    include_association :variant_mappings
    include_association :packages
    include_association :scripts
    include_association :templates
    include_association :properties
    include_association :dependencies
  end

  def next
    # Same parent, new version
    new_ver = amoeba_dup
    new_ver.version.succ!
    new_ver.save
    new_ver.reload
  end

  def clone(name)
    # Same version, new parent
    clone_ver = amoeba_dup
    clone_ver.app = App.new(name: name)
    clone_ver.save
    clone_ver.reload
  end

  def name
    parent.name
  end

  def deletable?
    return false if app_instances.any || inclusions.any
    true
  end

  def destroyable?
    return true if  deletable ||
                    instances.inject(false){ |res,i| res ||i.env_version.deploy_logs.any? } == false &&
                    ru_instances.inject(false){ |res,rui| res || rui.env_version.deploy_logs.any?} == false
    false
  end

  def destroy
    # should present the operator with a list of other objects which would be deleted along with this - confirmation
    return false unless destroyable?
    super
  end

  def delete
    return false unless deletable?
    super
  end
end
