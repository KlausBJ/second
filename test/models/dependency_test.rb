require 'test_helper'

class DependencyTest < ActiveSupport::TestCase
  test "links depender to dependee_masks etc" do
    a = App.create! name: 'TestDependencyApp'
    av = a.versions.create! name: '1.0'
    ad = Dependency.new depender: av
    assert ad.save!

    d = Db.create! name: 'TestDependencyDb'
    dv = d.versions.create! name: '1.0'
    dd = Dependency.new depender: dv
    assert dd.save!

    adm = DependeeMask.new dependency: ad, dependee: d, version_regex: '[234]\.'
    assert adm.save!
    ddm = DependeeMask.new dependency: dd, dependee: a, version_regex: '3\.'
    assert ddm.save!
  end

  test 'optional use of sequence and trigger' do
    a = App.create! name: 'TestDependencyApp'
    av = a.versions.create! name: '1.0'
    ad = Dependency.create! depender: av
    d = Db.create! name: 'TestDependencyDb'
    dv = d.versions.create! name: '1.0'
    dd = Dependency.create! depender: dv
    adm = DependeeMask.create! dependency: ad, dependee: d, version_regex: '[234]\.'
    ddm = DependeeMask.create! dependency: dd, dependee: a, version_regex: '3\.'
    follow = Trigger.create! name: 'go along with', follow: true, lead: false
    lead = Trigger.create! name: 'bring along', follow: false, lead: true
    mutual = Trigger.create! name: 'go along with and bring along', follow: true, lead: true
    ad.trigger = follow
    assert ad.save!
    ad.trigger = mutual
    assert ad.save!
    dd.trigger = lead
    assert dd.save!
    before = Sequence.new name: 'Deploy after', after: true
    after = Sequence.new name: 'Deploy before', after: false
    ad.sequence = before
    assert ad.save!
    dd.sequence = after
    assert dd.save!
  end
end
