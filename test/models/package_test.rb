require 'test_helper'

class PackageTest < ActiveSupport::TestCase
  test "should have file and version" do
		p = Package.new
		assert_not p.save
    cg = CredentialGroup.find_or_create_by(name: 'Install')
    et = EnvType.find_or_create_by(name: 'Test')
    dom = Domain.find_or_create_by(
            name: 'PenSam',
            netbios: 'PENSAM.DOM',
            dns: 'pensam.dk')
    c = Credential.create! name: 'Pemdep', credential_group: cg, env_type: et
    cv = CredentialVersion.create! name: '1.0', credential: c, domain: dom
    sh = Share.find_or_create_by!(
          name: 'TestRepository',
          path: '\\pemml13vm51.pensam.dk\Ruby',
          credential_version: cv)
    f = BinaryFile.create! share: sh, filename: 'test.zip', path: '', size: 7000
		a = App.create! name: 'App01'
		av = a.versions.create! name: '1.0'
		p.file = f
		p.version = av
		assert p.save!
  end
end
