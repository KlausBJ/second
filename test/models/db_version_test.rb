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
    p = Package.new file_object: f2, entity_version: dv
    assert p.save
    assert dv.packages.any?
    f3 = FileObject.create filename: 'test.txt'
    t = Template.new file_object: f3, entity_version: dv
    assert t.save
    assert dv.templates.any?
  end

  test 'validates version and interface uniqueness' do
    db = Db.create!(name: 'TestDb')
    dv = db.versions.last
    VariantMapping.create! name: 'Test', entity_version: dv
    assert dv.variant == 'Test'
    dv2 = dv.next
    assert dv2.variant == ''
    assert dv2.variant = dv.variant
    puts "variant: " + dv2.variant
    assert_not dv2.valid?
  end
end
