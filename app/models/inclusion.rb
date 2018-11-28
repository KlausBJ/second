# Relation between RuVersion and Version
class Inclusion < ApplicationRecord
  belongs_to :ru_version, inverse_of: :inclusions
  belongs_to :version, inverse_of: :inclusions

  # intentionally no amoeba block here
end
