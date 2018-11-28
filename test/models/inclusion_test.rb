require 'test_helper'

class InclusionTest < ActiveSupport::TestCase
  test "links versions to ru_version" do
    ru = ReleaseUnit.create name: 'TestInclusionRu'
    ruv = ru.versions.create name: '1.0'
    a = App.create name: 'TestInclusionApp'
    av = a.versions.create name: '1.0'
    d = Db.create name: 'TestInclusionDb'
    dv = d.versions.create name: '1.0'
    i1 = Inclusion.create ru_version: ruv, version: av
    i2 = Inclusion.create ru_version: ruv, version: dv
    assert ruv.inclusions.count == 2
  end
end
