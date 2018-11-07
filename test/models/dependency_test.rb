require 'test_helper'

class DependencyTest < ActiveSupport::TestCase
  test "links depender to dependee_masks etc" do
    a = App.create! name: 'TestDependencyApp'
    av = a.versions.last
    ad = Dependency.new depender: av
    assert ad.save

    d = Db.create name: 'TestDependencyDb'
    dv = d.versions.last
    dd = Dependency.new depender: dv
    assert dd.save

    adm = DependeeMask.new dependency: ad, dependee_entity: d, version_regex: '[234]\.'
    assert adm.save
    ddm = DependeeMask.new dependency: dd, dependee_entity: a, version_regex: '3\.'
    assert ddm.save
  end

  test 'optional use of deploy_sequence and deploy_trigger' do
    a = App.create! name: 'TestDependencyApp'
    av = a.versions.last
    ad = Dependency.create! depender: av
    d = Db.create! name: 'TestDependencyDb'
    dv = d.versions.last
    dd = Dependency.create! depender: dv
    adm = DependeeMask.create! dependency: ad, dependee_entity: d, version_regex: '[234]\.'
    ddm = DependeeMask.create! dependency: dd, dependee_entity: a, version_regex: '3\.'
    follow = DeployTrigger.create! name: 'go along with', mask: 1
    lead = DeployTrigger.create! name: 'bring along', mask: 2
    mutual = DeployTrigger.create! name: 'go along with and bring along', mask: 3
    ad.deploy_trigger = follow
    assert ad.save!
    ad.deploy_trigger = mutual
    assert ad.save!
    dd.deploy_trigger = lead
    assert dd.save!
    before = DeploySequence.new name: 'Deploy after', after: true
    after = DeploySequence.new name: 'Deploy before', after: false
    ad.deploy_sequence = before
    assert ad.save!
    dd.deploy_sequence = after
    assert dd.save!
  end
end
