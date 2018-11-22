# Describes (optional) requirements for specific deploy sequence
class DeploySequence < ApplicationRecord
  has_many :dependencies, inverse_of: :deploy_sequence
end
