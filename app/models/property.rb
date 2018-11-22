# Property - relates to AppVersion, DbVersion, EnvVersion, AppInstance or DbInstance
class Property < ApplicationRecord
  belongs_to :owner, polymorphic: true, inverse_of: :properties

  # intentionally no amoeba block here
end
