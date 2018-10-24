class Dependency < ApplicationRecord
  belongs_to :depender, polymorphic: true
  belongs_to :deploy_sequence
  belongs_to :deploy_trigger
  has_many :dependee_masks,  dependent: :destroy

end
