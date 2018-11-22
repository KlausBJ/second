# Relation between FileObject and AppVersion or DbVersion of type Script
class Script < ApplicationRecord
  belongs_to :file_object, inverse_of: :scripts
  belongs_to :entity_version, polymorphic: true, inverse_of: :scripts
end
