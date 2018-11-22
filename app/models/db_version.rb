# Versions of Db
class DbVersion < ApplicationRecord
  include VersionChecker

  belongs_to :db, inverse_of: :db_versions
  has_many :inclusions, as: :entity_version, dependent: :destroy, inverse_of: :db_version
  has_many :variant_mappings, as: :entity_version, dependent: :destroy, inverse_of: :entity_version
  has_many :variants, through: :variant_mappings
  has_many :packages, as: :entity_version, dependent: :destroy, inverse_of: :entity_version
  has_many :scripts, as: :entity_version, dependent: :destroy, inverse_of: :entity_version
  has_many :templates, as: :entity_version, dependent: :destroy, inverse_of: :entity_version
  has_many :properties, as: :owner, dependent: :destroy, inverse_of: :owner
  has_many :dependencies, as: :depender, dependent: :destroy, inverse_of: :depender
  has_many :db_instances, dependent: :destroy, inverse_of: :db_version

  alias_attribute :parent, :db
  alias_attribute :instances, :db_instances

  validate do
    errors.add(:variants, 'Variants/version combination not unique') unless int_ver_unique? version, variants.map{ |v| v.name }.join(',')
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
    clone_ver.db = Db.new(name: name)
    clone_ver.save
    clone_ver.reload
  end

  def name
    parent.name
  end
end
