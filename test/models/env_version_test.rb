require 'test_helper'

class EnvVersionTest < ActiveSupport::TestCase
  test 'can have deploylogs' do
    e = Environment.create name: 'TestDeployLogEnv'
    ev = e.versions.create name: '1.0'
    dl = DeployLog.create env_version: ev
    assert ev.deploy_logs.any?
  end

  test 'can generate new version with same content' do
    e = Environment.create name: 'TestEnvNewVersion'
    assert e.versions.none?
    ev = e.versions.create name: '1.0'
    assert e.versions.any?
    dl = DeployLog.create env_version: ev
    assert dl.persisted?
    a = App.create name: 'TestApp'
    assert a.persisted?
    av = a.versions.create name: '1.0'
    assert av.persisted?
    i1 = Implementation.create env_version: ev, changed_in: ev
    assert i1.persisted?
    ai = Instance.create version: av, env_version: ev, implementation: i1
    ai.reload
    assert ev.instances.any?
    d = Db.create name: 'TestDb'
    dv = d.versions.create name: '1.0'
    i2 = Implementation.create env_version: ev, changed_in: ev
    assert i2.persisted?
    di = Instance.create version: dv, env_version: ev, implementation: i2
    assert ev.instances.any?
    p1 = Property.create name: 'AppProperty', content: '42', overridable: false, owner: ai
    p2 = Property.create name: 'DbProperty', content: '42', overridable: false, owner: di
    p3 = Property.create name: 'EnvProperty', content: '42', overridable: false, owner: ev
    assert ai.properties.any?
    assert di.properties.any?
    assert ev.properties.any?
    assert ai.implementation.persisted?

    ev2 = ev.next
    assert_not ev2.name == ev.name
    assert ev2.instances.any?
    assert ev2.instances.any?
    assert ev.instances.first.version == ev2.instances.first.version
    assert ev.instances.first.version == ev2.instances.first.version
    assert ev2.properties.first.content == ev.properties.first.content
    assert ev.instances.first.properties.first.content == ev2.instances.first.properties.first.content
    assert ev.instances.first.properties.first.content== ev2.instances.first.properties.first.content
    assert ev2.instances.first.implementation.persisted?
    assert ev2.instances.first.implementation.id == ev.instances.first.implementation.id
  end

  test 'can generate new environment with same initial version' do
    e = Environment.create name: 'TestEnvNewVersion'
    ev = e.versions.create name: '1.0'
    ev.reload
    assert ev.persisted?
    dl = DeployLog.create env_version: ev
    a = App.create name: 'TestApp'
    av = a.versions.create name: '1.0'
    ai = Instance.create version: av, env_version: ev, implementation: Implementation.create(env_version: ev)
    assert ai.persisted?
    d = Db.create name: 'TestDb'
    dv = d.versions.create name: '1.0'
    di = Instance.create version: dv, env_version: ev, implementation: Implementation.create(env_version: ev)
    assert di.persisted?
    p1 = Property.create name: 'AppProperty', content: '42', overridable: false, owner: ai
    p2 = Property.create name: 'DbProperty', content: '42', overridable: false, owner: di
    p3 = Property.create name: 'EnvProperty', content: '42', overridable: false, owner: ev
    assert p1.persisted?
    assert p2.persisted?
    assert p3.persisted?
    assert ev.persisted?

    ev2 = ev.clone 'CloneEnv'
    ev2.reload
    assert_not ev.env == ev2.env
    assert ev2.instances.any?
    assert ev2.instances.any?
    assert ev.instances.first.version == ev2.instances.first.version
    assert ev.instances.first.version == ev2.instances.first.version
    assert ev2.properties.first.content == ev.properties.first.content
    assert ev.instances.first.properties.first.content == ev2.instances.first.properties.first.content
    assert ev.instances.first.properties.first.content== ev2.instances.first.properties.first.content
    assert_not ev.instances.first.implementation == ev2.instances.first.implementation
    puts ev.tree
    puts ev2.tree
  end

  test 'dependency_handler' do
    e = Environment.create name: 'TestEnvNewVersion'
    ev = e.versions.create name: '1.0'
    dl = DeployLog.create env_version: ev
    a = App.create name: 'TestApp'
    av = a.versions.create name: '1.0'
    ai = Instance.create version: av, env_version: ev, implementation: Implementation.create(env_version: ev)
    d = Db.create name: 'TestDb'
    dv = d.versions.create name: '1.0'
    dv2 = d.versions.create name: '1.1'
    ds = Sequence.create name: 'Deploy after', after: true
    assert ds.persisted?
    follow = Trigger.create! name: 'go along with', follow: true, lead: false
    assert follow.persisted?
    lead = Trigger.create! name: 'bring along', follow: false, lead: true
    assert lead.persisted?
    mutual = Trigger.create! name: 'go along with and bring along', follow: true, lead: true
    ad = Dependency.create! name: 'Database', depender: av, sequence: ds, trigger: follow
    assert ad.persisted?
    assert ad.depender == av
    av.reload
    assert av.dependencies.any?
    dm = DependeeMask.create dependency: ad, dependee: d, version_regex: ''
    ai.reload
    assert ai.dependencies.any?
    di = Instance.create version: dv, env_version: ev, implementation: Implementation.create(env_version: ev)
    di2 = Instance.create version: dv2, env_version: ev, implementation: Implementation.create(env_version: ev)
    p1 = Property.create name: 'AppProperty', content: '41', overridable: false, owner: ai
    p2 = Property.create name: 'DbProperty', content: '42', overridable: false, owner: di
    p2a = Property.create name: 'DbProperty', content: '44', overridable: false, owner: di2
    p3 = Property.create name: 'EnvProperty', content: '43', overridable: false, owner: ev
    dp = DeployPlan.create env_version: ev
    dpi1 = DeployPlanItem.create deploy_plan: dp, instance: di
    assert ai.appproperty == '41'
    assert ai.env.envproperty == '43'
    assert ai.dependees(ai.dependencies.first).any?
    assert ai.dependees(ai.dependencies.first).include? di
    assert_not ai.database == di
    ads = Selection.create! implementation: ai.implementation, dependency: ai.dependencies.first, env_version: ev, selected: ai.dependees(ai.dependencies.first).first
    assert ai.database == di
    assert ai.database.dbproperty == '42'
    assert a.to_s == a.name
    assert d.to_s == d.name
    assert av.to_s == av.name
    assert dv.to_s == dv.name
    ai.name = e.name + ' ' + ev.name + ': ' + a.name + ' ' + av.name
    di.name = e.name + ' ' + ev.name + ': ' + d.name + ' ' + dv.name
    assert ai.to_s == ai.name
    assert di.to_s == di.name
  end
end
