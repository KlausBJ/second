# Versions of Db
class DbVersion < ApplicationRecord
  belongs_to :db
  has_many :inclusions, as: :entity_version, dependent: :destroy
  has_many :interface_mappings, as: :entity_version, dependent: :destroy
  has_many :interfaces, through: :interface_mappings
  has_many :packages, as: :entity_version, dependent: :destroy
  has_many :scripts, as: :entity_version, dependent: :destroy
  has_many :templates, as: :entity_version, dependent: :destroy
  has_many :properties, as: :owner, dependent: :destroy
  has_many :dependencies, as: :depender, dependent: :destroy
  has_many :db_instances, dependent: :destroy

  alias_attribute :parent, :db
  alias_attribute :instances, :db_instances

  amoeba do
    customize(lambda { |original_ver, new_ver|
      new_ver.version = original_ver.version.succ
    })

    include_association :interface_mappings
    include_association :packages
    include_association :scripts
    include_association :templates
    include_association :properties
    include_association :dependencies
  end

  # new_ver?
  def next
    DbVersion.create db_id: db_id, version: version.succ
  end

  def name
    parent.name
  end

  def clone(name)
    dv = amoeba_dup
    dv.db = Db.new(name: name)
    dv.save
    return dv
  end
end
