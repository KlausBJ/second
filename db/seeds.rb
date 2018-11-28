# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' },
#   { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create an Environment with some versions
env = Environment.create!(name: 'ML00')
EnvVersion.create!(environment: env, version: '1.0')
9.times do
  ev = env.env_versions.last.next
  ev.save
end

# Create some Apps and Dbs with Versions
(1..25).each do |num|
  app = App.create!(name: "App_#{num}")
  Version.create!(deployable: app, version: '1.0')
  db = Db.create!(name: "Db_#{num}")
  Version.create!(deployable: db, version: '1.0')
  (1..9).each do |vernum|
    ev = env.env_versions[vernum]
    av = app.versions.last.next
    av.save
    fop = File.create!(
      path: "\\server\share\package_#{num * vernum * 3}.zip",
      filename: "package_#{num * vernum * 3}.zip"
    )
    fos = File.create!(
      path: "\\server\share\script_#{num * vernum * 3}.ps1",
      filename: "script_#{num * vernum * 3 + 1}.ps1"
    )
    fot = File.create!(
      path: "\\server\share\template_#{num * vernum * 3}.ini",
      filename: "template_#{num * vernum * 3 + 2}.ini"
    )
    Package.create!(order: 0, file: fop, version: av)
    Script.create!(order: 0, file: fos, version: av)
    Template.create!(
      file: fot,
      path: "folder\template_#{num * vernum * 3}.ini",
      version: av
    )
    dv = db.versions.last.next
    dv.save
    fop = File.create!(
      path: "\\server\share\package_#{num * vernum * 3}.bak",
      filename: "package_#{num * vernum * 3}.bak"
    )
    fos = File.create!(
      path: "\\server\share\script_#{num * vernum * 3}.sql",
      filename: "script_#{num * vernum * 3 + 1}.sql"
    )
    fot = File.create!(
      path: "\\server\share\template_#{num * vernum * 3}.csv",
      filename: "template_#{num * vernum * 3 + 2}.csv"
    )
    Package.create!(order: 0, file: fop, version: dv)
    Script.create!(order: 0, file: fos, version: dv)
    Template.create!(
      file: fot, path: "folder\template_#{num * vernum * 3}.csv",
      version: dv
    )
    dp = DeployPlan.create!(env_version: ev)
    ai = Instance.create!(version: av, env_version: ev)
    di = Instance.create!(version: dv, env_version: ev)
    dla = DeployLog.create!(env_version: ev, deployed: false)
    dld = DeployLog.create!(env_version: ev, deployed: false)
    EntityLog.create!(instance: ai, deploy_log: dla)
    EntityLog.create!(instance: di, deploy_log: dld)
    if vernum.even?
      DeployPlanItem.create!(
        deploy_plan: dp,
        instance: ai,
        after_item: di
      )
      DeployPlanItem.create!(
        deploy_plan: dp,
        instance: di
      )
    else
      DeployPlanItem.create!(
        deploy_plan: dp,
        instance: ai
      )
      DeployPlanItem.create!(
        deploy_plan: dp,
        instance: di,
        after_item: ai
      )
    end
  end
end
