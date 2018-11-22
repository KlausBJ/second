require 'test_helper'

class AppVersionTest < ActiveSupport::TestCase
  test 'AppVersion cloning' do
    app = App.create!(name: 'TestApp')
    av = app.app_versions.last
    new_av = av.clone('TestApp2')
    assert new_av.id != av.id
    assert new_av.class.to_s == 'AppVersion'
    assert new_av.app != av.app
    assert new_av.app.name == 'TestApp2'
  end

  test 'AppVersion can have Package, Script, Template' do
    app = App.create!(name: 'TestApp')
    av = app.app_versions.last
    f1 = FileObject.create filename: 'autoexec.bat'
    s = Script.new file_object: f1, entity_version: av
    assert s.save
    assert av.scripts.any?
    f2 = FileObject.create filename: 'overfoersel.zip'
    p = Package.new file_object: f2, entity_version: av
    assert p.save
    assert av.packages.any?
    f3 = FileObject.create filename: 'win.ini'
    t = Template.new file_object: f3, entity_version: av
    assert t.save
    assert av.templates.any?
  end

  test 'validates version and interface uniqueness' do
    app = App.create!(name: 'TestApp')
    av = app.versions.last
    v = Variant.find_or_create_by name: 'Test', entity: app
    av.variants << v
    assert av.variant == 'Test'
    av.save
    av2 = av.next
    assert_not (av.id == av2.id)
    assert av.variants.any?
    assert av2.variants.any?
    assert av2.variant == 'Test'
    av2.version = '1.0'
    assert_not av2.save
  end
end
