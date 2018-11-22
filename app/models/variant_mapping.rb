# Relation between Variant and AppVersion or DbVersion
class VariantMapping < ApplicationRecord
  belongs_to :variant, inverse_of: :variant_mappings
  belongs_to :entity_version, polymorphic: true, inverse_of: :variant_mappings

  validates :entity_version, presence: true

  amoeba do
    include_association :entity_version
  end

  # intentionally no amoeba block here

  #def initialize(options = {})
  #  variant = options[:variant] || Variant.find_or_create_by(entity:
  #    options[:entity_version].parent, name: options[:name])
  #  super(variant: variant, entity_version: options[:entity_version])
  #end
end
