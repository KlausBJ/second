require 'test_helper'

class TemplateTest < ActiveSupport::TestCase
  test "should have file_object and entity_version" do
		t = Template.new
		assert_not t.save
    f = FileObject.create
		a = App.create name: 'App01'
		av = a.app_versions.first
		t.file_object = f
		t.entity_version = av
		assert t.save
  end
end
