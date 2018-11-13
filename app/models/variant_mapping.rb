# Relation between Variant and AppVersion or DbVersion
class VariantMapping < ApplicationRecord
  belongs_to :variant
  belongs_to :entity_version, polymorphic: true

  # intentionally no amoeba block here

  def initialize(options = {})
    variant = options[:variant] || Variant.find_or_create_by(entity:
      options[:entity_version].parent, name: options[:name])
    super(variant: variant, entity_version: options[:entity_version])
  end
end
