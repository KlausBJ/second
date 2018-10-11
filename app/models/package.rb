class Package < ApplicationRecord
  belongs_to :file_object
  belongs_to :entity_version, polymorphic: true
	
	# intentionally no amoeba block here
	
end
