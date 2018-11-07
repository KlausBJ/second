require 'test_helper'

class RuVersionTest < ActiveSupport::TestCase
  test 'ru_version should relate to ru_instance' do
    ru = ReleaseUnit.create!(name: 'TestRU')
    ruv = ru.versions.last
    assert ruv.persisted?
    e = Environment.create! name: 'RuInstanceTest'
    ev = e.versions.last
    assert ev.persisted?
    rui = RuInstance.new ru_version: ruv, env_version: ev
    assert rui.save!
  end

  test 'ru_version and instance full relation test' do
    app = App.create!(name: 'TestApp')
    av = app.app_versions.last
    db = Db.create!(name: 'TestDb')
    dv = db.versions.last
    ru = ReleaseUnit.create!(name: 'TestRU')
    ruv = ru.versions.last
    i1 = Inclusion.new ru_version: ruv, entity_version: av
    assert i1.save!
    i2 = Inclusion.new ru_version: ruv, entity_version: dv
    assert i2.save!
    e = Environment.create! name: 'RuInstanceFullRelationTest'
    ev = e.versions.last
    rui = RuInstance.new ru_version: ruv, env_version: ev
    assert rui.save!
    ai = AppInstance.new env_version: ev, app_version: av, ru_instance: rui
    assert ai.save!
    di = DbInstance.new env_version: ev, db_version: dv, ru_instance: rui
    assert di.save!
  end
end
