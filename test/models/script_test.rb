require 'test_helper'

class ScriptTest < ActiveSupport::TestCase
  test "should have file_object and entity_version" do
		s = Script.new
		assert_not s.save
    f = FileObject.create
		a = App.create name: 'App01'
		av = a.app_versions.first
		s.file_object = f
		s.entity_version = av
		assert s.save
  end
end
