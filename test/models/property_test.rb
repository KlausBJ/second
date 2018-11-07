require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  test "Can belong to AppVersion" do
    a = App.create name: 'TestPropertyApp'
    av = a.versions.last
    p = Property.new name: 'TestProperty', content: '42', overridable: false, owner: av
    assert p.save
    assert av.properties.any?
  end

  test "Can belong to DbVersion" do
    d = Db.create name: 'TestPropertyDb'
    dv = d.versions.last
    p = Property.new name: 'TestProperty', content: '42', overridable: false, owner: dv
    assert p.save
    assert dv.properties.any?
  end

  test "Can belong to EnvVersion" do
    e = Environment.create name: 'TestPropertyEnv'
    ev = e.versions.last
    p = Property.new name: 'TestProperty', content: '42', overridable: false, owner: ev
    assert p.save
    assert ev.properties.any?
  end

  test "Can belong to AppInstance" do
    e = Environment.create name: 'TestPropertyEnv'
    ev = e.versions.last
    a = App.create name: 'TestPropertyApp'
    av = a.versions.last
    ai = AppInstance.create app_version: av, env_version: ev
    p = Property.new name: 'TestProperty', content: '42', overridable: false, owner: ai
    assert p.save
    assert ai.properties.any?
  end

  test "Can belong to DbInstance" do
    e = Environment.create name: 'TestPropertyEnv'
    ev = e.versions.last
    d = Db.create name: 'TestPropertyDb'
    dv = d.versions.last
    di = DbInstance.create db_version: dv, env_version: ev
    p = Property.new name: 'TestProperty', content: '42', overridable: false, owner: di
    assert p.save
    assert di.properties.any?
  end
end
