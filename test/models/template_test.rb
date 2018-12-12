require 'test_helper'

class TemplateTest < ActiveSupport::TestCase
  test "should have file and version" do
		t = Template.new
		assert_not t.save
    cg = CredentialGroup.find_or_create_by!(name: 'Install')
    et = EnvType.find_or_create_by!(name: 'Test')
    dom = Domain.find_or_create_by!(
            name: 'PenSam',
            netbios: 'PENSAM.DOM',
            dns: 'pensam.dk')
    c = Credential.create! name: 'Pemdep', credential_group: cg, env_type: et
    cv = CredentialVersion.create! name: '1.0', credential: c, domain: dom
    s = Share.find_or_create_by!(
          name: 'TestRepository',
          path: '\\pemml13vm51.pensam.dk\Ruby',
          credential_version: cv)
    f = AsciiFile.create! share: s, filename: 'test.txt', path: '', size: 70
		a = App.create! name: 'App01'
		av = a.versions.create! name: '1.0'
		t.file = f
		t.version = av
		assert t.save!
  end
end
