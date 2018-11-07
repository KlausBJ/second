require 'test_helper'

class EnvVersionTest < ActiveSupport::TestCase
  test "can have deploylogs" do
    e = Environment.create name: 'TestDeployLogEnv'
    ev = e.versions.first
    dl = DeployLog.create env_version: ev
    assert ev.deploy_logs.any?
  end
end
