require 'test_helper'

class EnvironmentTest < ActiveSupport::TestCase
  test "Should have at least one version" do
    e = Environment.create! name: 'TestVersionEnv'
    assert e.versions.none?
    e.versions.create!  name: '1.0',
                        env_type: EnvType.find_or_create_by!(name: 'Test')
    assert e.versions.any?
  end
end
