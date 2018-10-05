class Interface < ApplicationRecord
  belongs_to :entity, polymorphic: true
	has_many :interface_mappings, dependent: :destroy
	has_many :dependee_masks, dependent: :destroy
	
end
