require 'test_helper'

class AppTest < ActiveSupport::TestCase
  test 'Version should be created' do
    app = App.create!(name: 'TestApp')
    assert app.versions.none?
    av = app.versions.create! name: '1.0'
    assert app.versions.any?
  end
end
