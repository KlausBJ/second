# Property - relates to Version, EnvVersion or Instance
class Property < ApplicationRecord
  belongs_to :owner, polymorphic: true, inverse_of: :properties

  # intentionally no amoeba block here
end
