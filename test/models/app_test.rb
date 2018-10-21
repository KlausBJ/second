require 'test_helper'

class AppTest < ActiveSupport::TestCase
  test "AppVersion should be created" do
    app = App.create!(name: 'TestApp')
	assert app.app_versions.any?
  end
end
