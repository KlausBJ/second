require 'test_helper'

class PackageTest < ActiveSupport::TestCase
  test "should have file and version" do
		p = Package.new
		assert_not p.save
    f = BinaryFile.create
		a = App.create name: 'App01'
		av = a.versions.create name: '1.0'
		p.file = f
		p.version = av
		assert p.save
  end
end
