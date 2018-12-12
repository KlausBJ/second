require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  test "Can belong to Version" do
    a = App.create! name: 'TestPropertyApp'
    av = a.versions.create! name: '1.0'
    p1 = Property.new name: 'TestProperty',
                      content: '42',
                      overridable: false,
                      owner: av
    assert p1.save!
    assert av.properties.any?
    d = Db.create! name: 'TestPropertyDb'
    dv = d.versions.create! name: '1.0'
    p2 = Property.new name: 'TestProperty',
                      content: '42',
                      overridable: false,
                      owner: dv
    assert p2.save!
    assert dv.properties.any?
  end

  test "Can belong to EnvVersion" do
    e = Environment.create! name: 'TestPropertyEnv'
    ev = e.versions.create!  name: '1.0',
                            env_type: EnvType.find_or_create_by!(name: 'Test')
    p = Property.new  name: 'TestProperty',
                      content: '42',
                      overridable: false,
                      owner: ev
    assert p.save!
    assert ev.properties.any?
  end

  test "Can belong to Instance" do
    e = Environment.create! name: 'TestPropertyEnv'
    ev = e.versions.create! name: '1.0',
                            env_type: EnvType.find_or_create_by!(name: 'Test')
    dom = Domain.find_or_create_by!(
            name: 'PenSam',
            netbios: 'PENSAM.DOM',
            dns: 'pensam.dk')
    a = App.create! name: 'TestPropertyApp'
    av = a.versions.create! name: '1.0'
    ai = Instance.create!(
            version: av,
            env_version: ev,
            implementation: Implementation.create!(env_version: ev),
            server: Server.create!(name: 'VM40', domain: dom))
    p1 = Property.new name: 'TestProperty',
                      content: '42',
                      overridable: false,
                      owner: ai
    assert p1.save!
    assert ai.properties.any?
    d = Db.create! name: 'TestPropertyDb'
    dv = d.versions.create! name: '1.0'
    di = Instance.create!(
          version: dv,
          env_version: ev,
          implementation: Implementation.create!(env_version: ev),
    server: Server.create!(name: 'VM40', domain: dom))
    p2 = Property.new name: 'TestProperty',
                      content: '42',
                      overridable: false,
                      owner: di
    assert p2.save!
    assert di.properties.any?
  end
end
