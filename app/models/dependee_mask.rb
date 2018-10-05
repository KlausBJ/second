class DependeeMask < ApplicationRecord
  belongs_to :dependee
  belongs_to :interface
  belongs_to :dependee_entity, polymorphic: true
end
