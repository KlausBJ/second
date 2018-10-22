require 'test_helper'

class DbTest < ActiveSupport::TestCase
  test "DbVersion should be created" do
    db = Db.create!(name: 'TestDb')
	assert db.db_versions.any?
  end
end
