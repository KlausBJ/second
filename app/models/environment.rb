class Environment < ApplicationRecord
  has_many :env_versions, dependent: :destroy
  
end
