# Relation between Interface and AppVersion or DbVersion
class InterfaceMapping < ApplicationRecord
  belongs_to :interface
  belongs_to :entity_version, polymorphic: true

  # intentionally no amoeba block here

  def initialize(options = {})
    interface = Interface.find_or_create_by(entity:
      options[:entity_version].parent, name: options[:name])
    super(interface: interface, entity_version: options[:entity_version])
  end
end
