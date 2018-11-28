# Variant - relates to App or Db
class Variant < ApplicationRecord
  belongs_to :deployable, inverse_of: :variants
  has_many :variant_versions, dependent: :destroy, inverse_of: :variant
  has_many :versions, through: :variant_versions
  has_many :dependee_masks, dependent: :destroy, inverse_of: :variant

  scope :matches, ->(name) { where(name: name) if name.present? }
end
