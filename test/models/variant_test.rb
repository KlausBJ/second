require 'test_helper'

class VariantTest < ActiveSupport::TestCase
  test "variant relates to app or db" do
    a = App.create! name: 'VariantTestApp'
    av = a.versions.create! name: '1.0'
    v = Variant.create! name: 'Test', deployable: a
    aim = VariantVersion.create! variant: v, version: av
    ai = aim.variant
    assert aim.persisted?
    assert ai.persisted?
    assert av.variants.any?
    assert ai.variant_versions.any?
    ai.destroy!
    assert ai.destroyed?
    # assert aim.destroyed? will fail, but it is in fact gone from the database
    assert VariantVersion.where(id: aim.id).none?
    assert av.variants.none?
    assert av.variant_versions.none?

    d = Db.create! name: 'VariantTestDb'
    dv = d.versions.create! name: '1.0'
    v = Variant.create! name: 'Test', deployable: d
    dim = VariantVersion.create! variant: v, version: dv
    di = dim.variant
    assert dim.persisted?
    assert di.persisted?
    assert dv.variants.any?
    assert di.variant_versions.any?
    di.destroy!
    assert di.destroyed?
    # assert dim.destroyed? will fail, but it is in fact gone from the database
    assert VariantVersion.where(id: dim.id).none?
    assert dv.variants.none?
    assert dv.variant_versions.none?
  end
end
