# Application - versioned
class App < ApplicationRecord
  has_many :app_versions, dependent: :destroy, inverse_of: :app
  has_many :variants, as: :entity, dependent: :destroy, inverse_of: :entity
  has_many :dependee_masks, as: :dependee_entity, dependent: :destroy, inverse_of: :dependee_entity

	alias_attribute :versions, :app_versions

  validates :name, presence: true, uniqueness: true

  after_create :init_app_versions

  # test created and passed
  def init_app_versions
    return if AppVersion.where(app_id: id).any?

    AppVersion.create version: '1.0', app_id: id
  end
end
