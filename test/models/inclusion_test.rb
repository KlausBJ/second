require 'test_helper'

class InclusionTest < ActiveSupport::TestCase
  test "links app_versions and/or db_versions to ru_version" do
    ru = ReleaseUnit.create name: 'TestInclusionRu'
    ruv = ru.versions.last
    a = App.create name: 'TestInclusionApp'
    av = a.versions.last
    d = Db.create name: 'TestInclusionDb'
    dv = d.versions.last
    i1 = Inclusion.create ru_version: ruv, entity_version: av
    i2 = Inclusion.create ru_version: ruv, entity_version: dv
    assert ruv.inclusions.count == 2
  end
end
