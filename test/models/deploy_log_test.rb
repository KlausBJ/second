require 'test_helper'

class DeployLogTest < ActiveSupport::TestCase
  test "the truth" do
    e = Environment.create! name: 'TestDeployLogEnv'
    ev = e.versions.create name: '1.0', env_type: EnvType.find_or_create_by(name: 'Test')
    dl = DeployLog.create! env_version: ev
    assert ev.deploy_logs.any?
    app = App.create!(name: 'TestApp')
    av = app.versions.create name: '1.0'
    db = Db.create!(name: 'TestDb')
    dv = db.versions.create name: '1.0'
    ai = Instance.create! env_version: ev, version: av, implementation: Implementation.create(env_version: ev)
    di = Instance.create! env_version: ev, version: dv, implementation: Implementation.create(env_version: ev)
    el1 = Log.new deploy_log: dl, instance: ai
    assert el1.save!
    el2 = Log.new deploy_log: dl, instance: di
    assert el2.save!
  end
end
