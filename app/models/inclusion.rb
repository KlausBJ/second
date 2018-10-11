class Inclusion < ApplicationRecord
  belongs_to :ru_version
  belongs_to :entity_version, polymorphic: true
	
	# intentionally no amoeba block here
	
end
