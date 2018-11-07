# Dependency - describes the relation between depender and dependee
class Dependency < ApplicationRecord
  belongs_to :depender, polymorphic: true
  belongs_to :deploy_sequence, optional: true
  belongs_to :deploy_trigger, optional: true
  has_many :dependee_masks, dependent: :destroy
end
