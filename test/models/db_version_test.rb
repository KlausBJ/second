require 'test_helper'

class DbVersionTest < ActiveSupport::TestCase
  test 'DbVersion cloning' do
    db = Db.create!(name: 'TestDb')
    dv = db.versions.last
    new_dv = dv.clone('TestDb2')
    assert new_dv.id != dv.id
    assert new_dv.class.to_s == 'DbVersion'
    assert new_dv.db != dv.db
    assert new_dv.db.name == 'TestDb2'
  end

  test 'AppVersion can have Package, Script, Template' do
    db = Db.create!(name: 'TestDb')
    dv = db.versions.last
    f1 = FileObject.create filename: 'restore.sql'
    s = Script.new file_object: f1, entity_version: dv
    assert s.save
    assert dv.scripts.any?
    f2 = FileObject.create filename: 'obsdb.bak'
    pck = Package.new file_object: f2, entity_version: dv
    assert pck.save
    assert dv.packages.any?
    f3 = FileObject.create filename: 'test.txt'
    t = Template.new file_object: f3, entity_version: dv
    assert t.save
    assert dv.templates.any?
  end

  test 'validates version and interface uniqueness' do
    db = Db.create!(name: 'TestDb')
    dv = db.versions.last
    v = Variant.find_or_create_by name: 'Test', entity: db
    dv.variants << v
    assert dv.variant == 'Test'
    dv.save
    dv2 = dv.next
    assert_not (dv.id == dv2.id)
    assert dv.variants.any?
    assert dv2.variants.any?
    assert dv2.variant == 'Test'
    dv2.version = '1.0'
    assert_not dv2.save
  end
end
