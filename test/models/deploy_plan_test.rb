require 'test_helper'

class DeployPlanTest < ActiveSupport::TestCase
  test "relates to env_version" do
    e = Environment.create! name: 'RuInstanceFullRelationTest'
    ev = e.versions.create name: '1.0'
    app = App.create!(name: 'TestApp')
    av = app.versions.create name: '1.0'
    db = Db.create!(name: 'TestDb')
    dv = db.versions.create name: '1.0'
    ai = Instance.new env_version: ev, version: av
    di = Instance.new env_version: ev, version: dv
    dp = DeployPlan.new env_version: ev
    assert dp.save!
    # deploy_plan_items with "deploy after"
    dpi1 = DeployPlanItem.new deploy_plan: dp, instance: ai
    assert dpi1.save!
    dpi2 = DeployPlanItem.new deploy_plan: dp, instance: di, after_item: ai
    assert dpi2.save!
    dpi1.destroy!
    dpi2.destroy!
    # and vice versa
    dpi1 = DeployPlanItem.new deploy_plan: dp, instance: di
    assert dpi1.save!
    dpi2 = DeployPlanItem.new deploy_plan: dp, instance: ai, after_item: di
    assert dpi2.save!
  end
end
