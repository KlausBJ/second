# Application - versioned
class App < ApplicationRecord
  has_many :app_versions, dependent: :destroy
  has_many :interfaces, as: :entity, dependent: :destroy
  has_many :dependee_masks, as: :dependee_entity, dependent: :destroy

  after_create :init_app_versions

  # test created and passed
  def init_app_versions
    return if AppVersion.where(app_id: id).any?

    AppVersion.create version: '1.0', app_id: id
  end
end
