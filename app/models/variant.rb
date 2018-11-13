# Variant - relates to App or Db
class Variant < ApplicationRecord
  belongs_to :entity, polymorphic: true
  has_many :variant_mappings, dependent: :destroy
  has_many :dependee_masks, dependent: :destroy
end
