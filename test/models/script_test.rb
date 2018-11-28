require 'test_helper'

class ScriptTest < ActiveSupport::TestCase
  test "should have file and version" do
		s = Script.new
		assert_not s.save
    f = AsciiFile.create
		a = App.create name: 'App01'
		av = a.versions.create name: '1.0'
		s.file = f
		s.version = av
		assert s.save
  end
end
