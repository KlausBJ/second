class Dependee < ApplicationRecord
  belongs_to :dependency
	has_many :dependee_masks, dependent: :destroy
	
end
