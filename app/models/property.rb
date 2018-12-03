# Property - relates to Version, EnvVersion or Instance
class Property < ApplicationRecord
  # name
  # content
  # overridable

  belongs_to :owner, polymorphic: true, inverse_of: :properties

  # intentionally no amoeba block here

  def to_s
    content
  end
end
