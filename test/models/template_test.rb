require 'test_helper'

class TemplateTest < ActiveSupport::TestCase
  test "should have file and version" do
		t = Template.new
		assert_not t.save
    f = AsciiFile.create
		a = App.create name: 'App01'
		av = a.versions.create name: '1.0'
		t.file = f
		t.version = av
		assert t.save
  end
end
