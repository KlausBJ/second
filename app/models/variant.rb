# Variant - relates to App or Db
class Variant < ApplicationRecord
  # name

  belongs_to :deployable, inverse_of: :variants
  has_many :variant_versions, dependent: :destroy, inverse_of: :variant
  has_many :versions, through: :variant_versions
  #has_many :dependee_masks, dependent: :destroy, inverse_of: :variant
  has_many :variant_requirements, inverse_of: :variant
  has_many :dependee_masks, through: :variant_requirements

  scope :matches, ->(name) { where(name: name) if name.present? }
end
