# Relation between File and Version of type Script
class Script < ApplicationRecord
  # order
  # category

  belongs_to :file, class_name: 'AsciiFile', inverse_of: :scripts
  belongs_to :version, inverse_of: :scripts
end
