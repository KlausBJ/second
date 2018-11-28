# Relation between File and Version of type Package
class Package < ApplicationRecord
  belongs_to :file, class_name: 'BinaryFile', inverse_of: :packages
  belongs_to :version, inverse_of: :packages

  # intentionally no amoeba block here
end
