# Mask describing candidates for fulfilling a dependency
class DependeeMask < ApplicationRecord
  belongs_to :dependency
  belongs_to :variant, optional:true
  belongs_to :dependee_entity, polymorphic: true
end
