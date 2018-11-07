require 'test_helper'

class EnvironmentTest < ActiveSupport::TestCase
  test "Should have at least one version" do
    e = Environment.create name: 'TestVersionEnv'
    assert e.versions.any?
  end
end
