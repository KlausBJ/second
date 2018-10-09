class DependeeMask < ApplicationRecord
  belongs_to :dependency
  belongs_to :interface
  belongs_to :dependee_entity, polymorphic: true
end
