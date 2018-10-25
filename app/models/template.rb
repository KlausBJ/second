# Relation between FileObject and AppVersion or DbVersion of type Template
class Template < ApplicationRecord
  belongs_to :file_object
  belongs_to :entity_version, polymorphic: true
end
