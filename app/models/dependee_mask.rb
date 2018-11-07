# Mask describing candidates for fulfilling a dependency
class DependeeMask < ApplicationRecord
  belongs_to :dependency
  belongs_to :interface, optional:true
  belongs_to :dependee_entity, polymorphic: true
end
