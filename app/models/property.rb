class Property < ApplicationRecord
  belongs_to :owner, polymorphic: true
	
end
