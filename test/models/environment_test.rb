require 'test_helper'

class EnvironmentTest < ActiveSupport::TestCase
  test "Should have at least one version" do
    e = Environment.create name: 'TestVersionEnv'
    assert e.versions.none?
    e.versions.create name: '1.0'
    assert e.versions.any?
  end
end
