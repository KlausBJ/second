require 'test_helper'

class ReleaseUnitTest < ActiveSupport::TestCase
  test 'RuVersion should be created' do
    ru = ReleaseUnit.create!(name: 'TestRU')
    assert ru.ru_versions.none?
    ruv = ru.versions.create! name: '1.0'
    assert ru.versions.any?
  end
end
