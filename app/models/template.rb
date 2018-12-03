# Relation between File and Version of type Template
class Template < ApplicationRecord
  # path

  belongs_to :file, class_name: 'AsciiFile', inverse_of: :templates
  belongs_to :version, inverse_of: :templates
end
