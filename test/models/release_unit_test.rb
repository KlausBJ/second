require 'test_helper'

class ReleaseUnitTest < ActiveSupport::TestCase
  test 'RuVersion should be created' do
    ru = ReleaseUnit.create(name: 'TestRU')
    assert ru.ru_versions.any?
  end
end
