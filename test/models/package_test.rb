require 'test_helper'

class PackageTest < ActiveSupport::TestCase
  test "should have file_object and entity_version" do
		p = Package.new
		assert_not p.save
    f = FileObject.create
		a = App.create name: 'App01'
		av = a.app_versions.first
		p.file_object = f
		p.entity_version = av
		assert p.save
  end
end
