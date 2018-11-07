require 'test_helper'

class DeployLogTest < ActiveSupport::TestCase
  test "the truth" do
    e = Environment.create! name: 'TestDeployLogEnv'
    ev = e.versions.first
    dl = DeployLog.create! env_version: ev
    assert ev.deploy_logs.any?
    app = App.create!(name: 'TestApp')
    av = app.app_versions.last
    db = Db.create!(name: 'TestDb')
    dv = db.versions.last
    ai = AppInstance.create! env_version: ev, app_version: av
    di = DbInstance.create! env_version: ev, db_version: dv
    el1 = EntityLog.new deploy_log: dl, entity_instance: ai
    assert el1.save!
    el2 = EntityLog.new deploy_log: dl, entity_instance: di
    assert el2.save!
  end
end
