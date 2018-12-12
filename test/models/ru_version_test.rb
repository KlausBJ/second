require 'test_helper'

class RuVersionTest < ActiveSupport::TestCase
  test 'ru_version should relate to ru_instance' do
    ru = ReleaseUnit.create!(name: 'TestRU')
    ruv = ru.versions.create! name: '1.0'
    assert ruv.persisted?
    e = Environment.create! name: 'RuInstanceTest'
    ev = e.versions.create!  name: '1.0',
                            env_type: EnvType.find_or_create_by!(name: 'Test')
    assert ev.persisted?
    rui = RuInstance.new ru_version: ruv, env_version: ev
    assert rui.save!
  end

  test 'ru_version and instance full relation test' do
    app = App.create!(name: 'TestApp')
    av = app.versions.create! name: '1.0'
    db = Db.create!(name: 'TestDb')
    dv = db.versions.create! name: '1.0'
    ru = ReleaseUnit.create!(name: 'TestRU')
    ruv = ru.versions.create! name: '1.0'
    i1 = Inclusion.new ru_version: ruv, version: av
    assert i1.save!
    i2 = Inclusion.new ru_version: ruv, version: dv
    assert i2.save!
    e = Environment.create! name: 'RuInstanceFullRelationTest'
    ev = e.versions.create!  name: '1.0',
                            env_type: EnvType.find_or_create_by!(name: 'Test')
    dom = Domain.find_or_create_by!(
            name: 'PenSam',
            netbios: 'PENSAM.DOM',
            dns: 'pensam.dk')
    rui = RuInstance.new ru_version: ruv, env_version: ev
    assert rui.save!
    ai = Instance.new(
            env_version: ev,
            version: av,
            ru_instance: rui,
            implementation: Implementation.create!(env_version: ev),
            server: Server.find_or_create_by!(name: 'VM40', domain: dom))
    assert ai.save!
    di = Instance.new(
            env_version: ev,
            version: dv,
            ru_instance: rui,
            implementation: Implementation.create!(env_version: ev),
            server: Server.find_or_create_by!(name: 'VM40', domain: dom))
    assert di.save!
  end
end
