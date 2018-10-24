class Template < ApplicationRecord
  belongs_to :file_object
  belongs_to :entity_version, polymorphic: true
  
end
