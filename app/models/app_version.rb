# Versions of App
class AppVersion < ApplicationRecord
  include VersionChecker

  belongs_to :app
  has_many :inclusions, as: :entity_version, dependent: :destroy
  has_many :variant_mappings, as: :entity_version, dependent: :destroy
  has_many :variants, through: :variant_mappings
  has_many :packages, as: :entity_version, dependent: :destroy
  has_many :scripts, as: :entity_version, dependent: :destroy
  has_many :templates, as: :entity_version, dependent: :destroy
  has_many :properties, as: :owner, dependent: :destroy
  has_many :dependencies, as: :depender, dependent: :destroy
  has_many :app_instances, dependent: :destroy

  alias_attribute :parent, :app
  alias_attribute :instances, :app_instances

  amoeba do
    customize(lambda { |original_ver, new_ver|
      new_ver.version = original_ver.version.succ
    })

    include_association :variant_mappings
    include_association :packages
    include_association :scripts
    include_association :templates
    include_association :properties
    include_association :dependencies
  end

  # new_ver?
  def next
    AppVersion.create app_id: app_id, version: version.succ
  end

  def name
    parent.name
  end

  def clone(name)
    av = amoeba_dup
    av.app = App.new(name: name)
    av.save
    return av
  end
end
