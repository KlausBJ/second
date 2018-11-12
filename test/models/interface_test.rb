require 'test_helper'

class VariantTest < ActiveSupport::TestCase
  test "links to app or db" do
    a = App.create! name: 'VariantTestApp'
    av = a.versions.last
    aim = VariantMapping.create! name: 'Test', entity_version: av
    ai = aim.variant
    assert aim.persisted?
    assert ai.persisted?
    assert av.variants.any?
    assert ai.variant_mappings.any?
    ai.destroy!
    assert ai.destroyed?
    # assert aim.destroyed? will fail, but it is in fact gone from the database
    assert VariantMapping.where(id: aim.id).none?
    assert av.variants.none?
    assert av.variant_mappings.none?

    d = Db.create! name: 'VariantTestDb'
    dv = d.versions.last
    dim = VariantMapping.create! name: 'Test', entity_version: dv
    di = dim.variant
    assert dim.persisted?
    assert di.persisted?
    assert dv.variants.any?
    assert di.variant_mappings.any?
    di.destroy!
    assert di.destroyed?
    # assert dim.destroyed? will fail, but it is in fact gone from the database
    assert VariantMapping.where(id: dim.id).none?
    assert dv.variants.none?
    assert dv.variant_mappings.none?
  end
end
