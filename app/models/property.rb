class Property < ApplicationRecord
  belongs_to :owner, polymorphic: true
  
  # intentionally no amoeba block here

end
