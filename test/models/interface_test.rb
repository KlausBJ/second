require 'test_helper'

class InterfaceTest < ActiveSupport::TestCase
  test "links to app or db" do
    a = App.create! name: 'InterfaceTestApp'
    av = a.versions.last
    aim = InterfaceMapping.create! name: 'Test', entity_version: av
    ai = aim.interface
    assert aim.persisted?
    assert ai.persisted?
    assert av.interfaces.any?
    assert ai.interface_mappings.any?
    ai.destroy!
    assert ai.destroyed?
    # assert aim.destroyed? will fail, but it is in fact gone from the database
    assert InterfaceMapping.where(id: aim.id).none?
    assert av.interfaces.none?
    assert av.interface_mappings.none?

    d = Db.create! name: 'InterfaceTestDb'
    dv = d.versions.last
    dim = InterfaceMapping.create! name: 'Test', entity_version: dv
    di = dim.interface
    assert dim.persisted?
    assert di.persisted?
    assert dv.interfaces.any?
    assert di.interface_mappings.any?
    di.destroy!
    assert di.destroyed?
    # assert dim.destroyed? will fail, but it is in fact gone from the database
    assert InterfaceMapping.where(id: dim.id).none?
    assert dv.interfaces.none?
    assert dv.interface_mappings.none?
  end
end
