class FileObject < ApplicationRecord
	has_many :packages
	has_many :scripts
	has_many :templates
	
end
