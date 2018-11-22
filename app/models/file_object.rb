# Represents a FileObject - referenced by Package, Script or Template
class FileObject < ApplicationRecord
  has_many :packages, inverse_of: :file_object
  has_many :scripts, inverse_of: :file_object
  has_many :templates, inverse_of: :file_object
end
