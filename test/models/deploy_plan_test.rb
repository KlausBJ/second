require 'test_helper'

class DeployPlanTest < ActiveSupport::TestCase
  test "relates to env_version" do
    e = Environment.create! name: 'RuInstanceFullRelationTest'
    ev = e.versions.last
    app = App.create!(name: 'TestApp')
    av = app.app_versions.last
    db = Db.create!(name: 'TestDb')
    dv = db.versions.last
    ai = AppInstance.new env_version: ev, app_version: av
    di = DbInstance.new env_version: ev, db_version: dv
    dp = DeployPlan.new env_version: ev
    assert dp.save!
    # deploy_plan_items with "deploy after"
    dpi1 = DeployPlanItem.new deploy_plan: dp, entity_instance: ai
    assert dpi1.save!
    dpi2 = DeployPlanItem.new deploy_plan: dp, entity_instance: di, after_item: ai
    assert dpi2.save!
    dpi1.destroy!
    dpi2.destroy!
    # and vice versa
    dpi1 = DeployPlanItem.new deploy_plan: dp, entity_instance: di
    assert dpi1.save!
    dpi2 = DeployPlanItem.new deploy_plan: dp, entity_instance: ai, after_item: di
    assert dpi2.save!
  end
end
