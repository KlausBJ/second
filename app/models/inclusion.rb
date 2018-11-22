# Relation between RuVersion and AppVersion or DbVersion
class Inclusion < ApplicationRecord
  belongs_to :ru_version, inverse_of: :inclusions
  belongs_to :entity_version, polymorphic: true, inverse_of: :inclusions

  # intentionally no amoeba block here
end
