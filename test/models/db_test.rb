require 'test_helper'

class DbTest < ActiveSupport::TestCase
  test 'Version should not be created' do
    db = Db.create!(name: 'TestDb')
    assert db.versions.none?
    dv = Version.create! deployable: db, name: '1.0'
    assert db.versions.any?
  end
end
