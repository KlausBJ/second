# Mask describing candidates for fulfilling a dependency
class DependeeMask < ApplicationRecord
  belongs_to :dependency, inverse_of: :dependee_masks
  belongs_to :variant, optional:true, inverse_of: :dependee_masks
  belongs_to :dependee, class_name: 'Deployable', foreign_key: :dependee_id, inverse_of: :dependee_masks
end
