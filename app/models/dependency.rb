# Dependency - describes the relation between depender and dependee
class Dependency < ApplicationRecord
  belongs_to :depender, class_name: 'Version', inverse_of: :dependencies
  belongs_to :sequence, optional: true, inverse_of: :dependencies
  belongs_to :trigger, optional: true, inverse_of: :dependencies
  has_many :dependee_masks, dependent: :destroy, inverse_of: :dependency

  def candidates(instance) #temporary - should perhaps be in the Version class?
    puts 'Dependency#candidates called.'
    return 1
  end
end
