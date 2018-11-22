# Relation between FileObject and AppVersion or DbVersion of type Package
class Package < ApplicationRecord
  belongs_to :file_object, inverse_of: :packages
  belongs_to :entity_version, polymorphic: true, inverse_of: :packages

  # intentionally no amoeba block here
end
