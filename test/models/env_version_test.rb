require 'test_helper'

class EnvVersionTest < ActiveSupport::TestCase
  test 'can have deploylogs' do
    e = Environment.create name: 'TestDeployLogEnv'
    ev = e.versions.first
    dl = DeployLog.create env_version: ev
    assert ev.deploy_logs.any?
  end

  test 'can generate new version with same content' do
    e = Environment.create name: 'TestEnvNewVersion'
    assert e.versions.any?
    ev = e.versions.last
    dl = DeployLog.create env_version: ev
    a = App.create name: 'TestApp'
    av = a.versions.last
    ai = AppInstance.create app_version: av, env_version: ev
    assert ev.app_instances.any?
    d = Db.create name: 'TestDb'
    dv = d.versions.last
    di = DbInstance.create db_version: dv, env_version: ev
    assert ev.db_instances.any?
    p1 = Property.create name: 'AppProperty', content: '42', overridable: false, owner: ai
    p2 = Property.create name: 'DbProperty', content: '42', overridable: false, owner: di
    p3 = Property.create name: 'EnvProperty', content: '42', overridable: false, owner: ev
    assert ai.properties.any?
    assert di.properties.any?
    assert ev.properties.any?

    ev2 = ev.next
    assert_not ev2.version == ev.version
    assert ev2.app_instances.any?
    assert ev2.db_instances.any?
    assert ev.app_instances.first.app_version == ev2.app_instances.first.app_version
    assert ev.db_instances.first.db_version == ev2.db_instances.first.db_version
    assert ev2.properties.first.content == ev.properties.first.content
    assert ev.app_instances.first.properties.first.content == ev2.app_instances.first.properties.first.content
    assert ev.db_instances.first.properties.first.content== ev2.db_instances.first.properties.first.content
  end

  test 'can generate new environment with same initial version' do
    e = Environment.create name: 'TestEnvNewVersion'
    ev = e.versions.last
    dl = DeployLog.create env_version: ev
    a = App.create name: 'TestApp'
    av = a.versions.last
    ai = AppInstance.create app_version: av, env_version: ev
    d = Db.create name: 'TestDb'
    dv = d.versions.last
    di = DbInstance.create db_version: dv, env_version: ev
    p1 = Property.create name: 'AppProperty', content: '42', overridable: false, owner: ai
    p2 = Property.create name: 'DbProperty', content: '42', overridable: false, owner: di
    p3 = Property.create name: 'EnvProperty', content: '42', overridable: false, owner: ev

    ev2 = ev.clone 'CloneEnv'
    assert_not ev.name == ev2.name
    assert ev2.app_instances.any?
    assert ev2.db_instances.any?
    assert ev.app_instances.first.app_version == ev2.app_instances.first.app_version
    assert ev.db_instances.first.db_version == ev2.db_instances.first.db_version
    assert ev2.properties.first.content == ev.properties.first.content
    assert ev.app_instances.first.properties.first.content == ev2.app_instances.first.properties.first.content
    assert ev.db_instances.first.properties.first.content== ev2.db_instances.first.properties.first.content
  end

  test 'dependency_handler' do
    e = Environment.create name: 'TestEnvNewVersion'
    ev = e.versions.last
    dl = DeployLog.create env_version: ev
    a = App.create name: 'TestApp'
    av = a.versions.last
    ai = AppInstance.create app_version: av, env_version: ev
    d = Db.create name: 'TestDb'
    dv = d.versions.last
    ds = DeploySequence.create name: 'Deploy after', after: true
    follow = DeployTrigger.create! name: 'go along with', mask: 1
    lead = DeployTrigger.create! name: 'bring along', mask: 2
    mutual = DeployTrigger.create! name: 'go along with and bring along', mask: 3
    ad = Dependency.create name: 'Database', depender: av, deploy_sequence: ds, deploy_trigger: follow
    dm = DependeeMask.create dependency: ad, dependee_entity: d, version_regex: ''
    di = DbInstance.create db_version: dv, env_version: ev
    p1 = Property.create name: 'AppProperty', content: '42', overridable: false, owner: ai
    p2 = Property.create name: 'DbProperty', content: '42', overridable: false, owner: di
    p3 = Property.create name: 'EnvProperty', content: '42', overridable: false, owner: ev
    dp = DeployPlan.create env_version: ev
    dpi1 = DeployPlanItem.create deploy_plan: dp, entity_instance: di
    #puts 'database_candidates: ' + ai.database_candidates.to_s
    assert ai.database_candidates
    #puts 'database: ' + ai.database.to_s
    #assert ai.database == di
  end
end
