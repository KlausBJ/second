# standard ActiveRecord class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def assocs
    self.class.reflect_on_all_associations.map(&:name)
  end
end
