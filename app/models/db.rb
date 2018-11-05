# Databases - versioned
class Db < ApplicationRecord
  has_many :db_versions, dependent: :destroy
  has_many :interfaces, as: :entity, dependent: :destroy
  has_many :dependee_masks, as: :dependee_entity, dependent: :destroy

  alias_attribute :versions, :db_versions

	validates :name, presence: true, uniqueness: true

  after_create :init_db_versions

  # test created and passed
  def init_db_versions
    return if DbVersion.where(db_id: id).any?

    DbVersion.create version: '1.0', db_id: id
  end
end
