# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' },
#   { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create domains
pensam = Domain.find_or_create_by! name: 'Pensam', dns: 'pensam.dk', netbios: 'PENSAM.DOM'
ptintra = Domain.find_or_create_by! name: 'PTINTRA', dns: 'ptintra.pensam.dk', netbios: 'PTINTRA'
ptdmz = Domain.find_or_create_by! name: 'PTDMZ', dns: 'ptdmz.pensam.dk', netbios: 'PTDMZ'
dmz = Domain.find_or_create_by! name: 'PTDMZ', dns: 'dmz.pensam.dk', netbios: 'DMZ'
kmd = Domain.find_or_create_by! name: 'Kmd', dns: 'intern.kmd.dk', netbios: 'KMD'

# create env_types
dev = EnvType.find_or_create_by! name: 'Development'
test = EnvType.find_or_create_by! name: 'Test'
preprod = EnvType.find_or_create_by! name: 'PreProduction'
prod = EnvType.find_or_create_by! name: 'Production'

# Create environments with initial versions
env = Environment.find_or_create_by name: 'BT01'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'CT01'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'Datawarehouse servers'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: prod
env = Environment.find_or_create_by name: 'DEV01'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'DEV02'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'DEV03'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'DEV04'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'Edlund_Clients'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: prod
env = Environment.find_or_create_by name: 'ML11'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML12'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML13'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML14'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML16'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML17'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML18'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML20'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML22'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML22-TcM'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML23'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML24'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML25'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML26'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML27'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML28'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML29'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML3'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML30'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML31'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML33'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML34'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML34a'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML35'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML36'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML37'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML38'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML40'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML41'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML42'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML43'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML44'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML45'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML46'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML47'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML48'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML49'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML50'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML51'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML51UAT'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML54'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML56'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML57'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML58'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML6'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML62'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML65'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML66'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML67'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML68'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML69'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML7'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML70'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML71'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML72'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML73'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML75'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML76'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML77'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML78'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML89'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML91'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML92'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML93'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML95'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML96'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML97'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML98'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'ML99'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'PreProd'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: preprod
env = Environment.find_or_create_by name: 'Prod'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: prod
env = Environment.find_or_create_by name: 'Prod_PK'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: prod
env = Environment.find_or_create_by name: 'SQL'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: prod
env = Environment.find_or_create_by name: 'ST'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: test
env = Environment.find_or_create_by name: 'TMA-DML01'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: prod
env = Environment.find_or_create_by name: 'zHost Server - 01 - Windows update'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: prod
env = Environment.find_or_create_by name: 'zHost Server - 03 - VMWare update'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: prod
env = Environment.find_or_create_by!(
        name: 'zHost Server - 034 - Safe VM_Shutdown')
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: prod
env = Environment.find_or_create_by!(
        name: 'zHost Server - 035 - VMWare post install cleanup')
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: prod
env = Environment.find_or_create_by name: 'zHost Server - 05 - Defrag'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: prod
env = Environment.find_or_create_by!(
        name: 'zHost Server - 06 - Mirror dirs InuseWithBackup')
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: prod
env = Environment.find_or_create_by!(
        name: 'zHost Server - 06 – Restart all host servers')
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: prod
env = Environment.find_or_create_by name: 'zHost Server - 07 - Antivirus'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: prod
env = Environment.find_or_create_by!(
        name: 'zHost Server tools - Install MailAlert')
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: prod
env = Environment.find_or_create_by!(
        name: 'zHost Server tools - Install SQL server')
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: prod
env = Environment.find_or_create_by!(
        name: 'zHost Server tools - Install Time Sync')
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: prod
env = Environment.find_or_create_by name: 'zHost_Server - PEMIX## tillæg'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: prod
env = Environment.find_or_create_by name: 'zVMDeploy'
EnvVersion.find_or_create_by! environment: env, name: '1.0', env_type: prod

# set up a share (Repository) for all the files
cg = CredentialGroup.find_or_create_by! name: 'Share credentials'
c = Credential.find_or_create_by!(
        env_type: test,
        credential_group: cg,
        name: 'Share credential')
cv = CredentialVersion.find_or_create_by!(
        name: 'Share credential pemdep',
        username: 'pemdep',
        domain: pensam,
        credential: c)
cv.password = 'PsPemDep'
cv.save!
share = Share.find_or_create_by!(
            name: 'Repository',
            path: '\\\\pemml13vm51\\Ruby',
            credential_version: cv)

# create databases, each with 2 versions, each with 1 package, 1 script
db = Db.find_or_create_by! name: 'AdraMatchDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'AogF-Konvertering'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'BMSKernelDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'BMSWEBInputDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'CentralLoggingDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'CSLDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'CSLSTARDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'Ctrlm630'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'CUBUSDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'DASDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'DiskvalUdbetalDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'EdlundFleksionDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'EdlundLLPdb'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'EdlundPSLDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'em630'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'FLXUDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'ForbrugergruppeDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'HealthCompassDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'HoldFastDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'IndlaesningDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'KISRAPDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'KundeOvervaagningDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'LaaneansoegningDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'LifeStepsDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'MOFDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'NeuronDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'OBSDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'OMSFileStorage'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'PAKSIntegrationDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'PDVDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'PDW_DatamartDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'PDW_StagingDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'PenSamPalDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'PensionsoverblikDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'PI_CSLDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'PI_EksternDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'PI_InternDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'PI_KPI_DB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'PI_MOFDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'PI_PersonSyncDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'PO_Master'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'POS2012_Pensionister'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'PSLP10DB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'PSLP12DB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'PSLP90DB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'PSP_PKBeregn_PSLiv'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'PSP_PKBeregn_PSLiv_gl_rentebonussatser'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'RettighedsDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'SA LokalLoggingDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'ServicePortalDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'ServicevindueDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'SILogDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'StagingDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'TransformDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'VAKSDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'WLMDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'WZ_CubusEdlund_WorkzoneDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
db = Db.find_or_create_by! name: 'xRMDB'
dbv = Version.find_or_create_by! name: '1.0', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)
dbv = Version.find_or_create_by! name: '1.1', deployable: db
binfile = BinaryFile.find_or_create_by!(
            filename: dbv.parent.name + '_' + dbv.name + '.bak',
            path: dbv.parent.name,
            size: 1000000000,
            share: share)
Package.find_or_create_by!(file: binfile, version: dbv)
sql = AsciiFile.find_or_create_by!(
            filename: 'update.sql',
            path: db.name,
            size: 1000,
            share: share)
Script.find_or_create_by!(file: sql, version: dbv)

# create applications, each with 2 versions, each with 1 package, 1 script, and 1 template
appnames = [
  'AdraDir',
  'AdraMatch Client',
  'ALM',
  'AppLayer Finished',
  'AppPool',
  'AutomatiskMatch',
  'BankGraenseflade',
  'BatchScript',
  'BMS_GDPR',
  'BMSKernelWEB',
  'BMSKernelWrap',
  'BMSKernelWS',
  'BMSPassWordUtil',
  'BMSPassWordWS',
  'BMSStatisticsWEB',
  'BMSStatisticsWS',
  'BMSWEBInputWEB',
  'BMSWEBInputWrap',
  'BMSWEBInputWS',
  'CabArc',
  'Centrallog DB update',
  'ConfigLayer Finished',
  'CubusAkteringsAgent',
  'CubusEdlund_Workzone_update',
  'CubusEdlundApp',
  'CubusEdlundWCF',
  'DASDB Update',
  'DasWebSvc',
  'DasWebSvc_Update',
  'DasWinSvc',
  'DCOM',
  'DeployDB',
  'Deployment Script delivery',
  'Disk_Udb',
  'Doc2Mail',
  'Doc2Mail Certifikat',
  'EBS',
  'Edlund Application Web',
  'Edlund Autotest',
  'Edlund CommonShare',
  'Edlund Ctrl-M',
  'Edlund Dev client',
  'Edlund Dev ResetDB',
  'Edlund Dev Web (setup job)',
  'Edlund Dev Web Master',
  'Edlund Devfolder',
  'Edlund DirWatch',
  'Edlund Fleksion VirtDir',
  'Edlund GBT',
  'Edlund Hotfix',
  'Edlund Hotfix Apply',
  'Edlund Job I',
  'Edlund Job II',
  'Edlund Kundeforhold',
  'Edlund LLP VirtDir',
  'Edlund Persondata share',
  'Edlund PSL VirtDir',
  'Edlund Register',
  'Edlund Registermaster',
  'Edlund Release',
  'Edlund Release Hotfix',
  'Edlund Rettigheder',
  'Edlund Servertalis check',
  'Edlund Setup Web',
  'Edlund Shortcuts',
  'Edlund Symlink',
  'Edlund SystemData',
  'Edlund Tariffiler',
  'Edlund TransferProt',
  'Edlund Transferprot Check',
  'EnvAccess',
  'EnvCheck',
  'EventLog',
  'FileShare_Deploy',
  'FilShare',
  'FL KundeServiceWS',
  'FL LogRaadgivning',
  'Folder',
  'Forbrugergruppenet Basis',
  'Forbrugergruppenet Deploy',
  'Forbrugergruppenet Finalize',
  'GDPR Transform',
  'GDPR_SILogDB',
  'HealthCompassService',
  'HoldFastConsol',
  'HoldFastWeb',
  'HPE UFT',
  'IGY',
  'IGY K27',
  'IGY K42',
  'Ingres Opdatering',
  'Ingres_Data',
  'KEA',
  'KIS_Xml_Done',
  'KIS_Xml_Export',
  'KIS_Xml_Failed',
  'Kis2KisRapDB',
  'KIS2Neuron',
  'KISRAPWEB',
  'KISRAPWEB User',
  'KreditScore - klient',
  'KreditScore - sletning',
  'LifeLink+',
  'LiteSpeed Extractor',
  'Logfolder',
  'MOFAPP',
  'MRPus',
  'MSMQ_CreateQueue',
  'Neuron BusinessServices',
  'Neuron Certifikat',
  'Neuron Data',
  'Neuron DeployAccess',
  'Neuron DokumentHaandtering',
  'Neuron ExtInd',
  'Neuron ExtUd',
  'Neuron License',
  'Neuron LivNet',
  'Neuron Oekonomi',
  'Neuron OSI',
  'Neuron Runtime',
  'Neuron SI',
  'Neuron SPRING',
  'Neuron User',
  'Neuron Xml',
  'Neuron_POPDK',
  'NeuronCommon',
  'OBS DB Update',
  'OBS Kundeforhold',
  'OBS Overfoersel',
  'OBS Tilbud',
  'OBS_Tilbud_Hotfix',
  'OekonomiAdapter',
  'Online Basis',
  'Online Deploy',
  'OnlineVD',
  'Oracle Data Provider',
  'PAKS Batch',
  'PAKS Gui',
  'PAKS Skat',
  'PAKS Skat Output',
  'PAL 2010 Administrator Website',
  'PAL 2010 WCF Service',
  'PAL 2010 Website',
  'PAL 2010 Windows Command Line Utility',
  'PAL 2010 Windows Service',
  'PAL 2010 XML Output Dir',
  'PDFReducer',
  'PDW_DatamartDB_deploy',
  'PDW_Staging_Base',
  'PDW_StagingDB_deploy',
  'PenSam Online',
  'PensInfoServicesWS',
  'PensionsInfo_Users',
  'PensionsInfoOR',
  'PensionsInfoWS',
  'Pensionsoverblik GetPal',
  'Pensionsoverblik ODBC',
  'Pensionsoverblik SSIS',
  'Pensionsoverblik_UpdateDB',
  'PI_AppLog',
  'PI_Datamart',
  'PI_FileShare',
  'PI_Staging',
  'Portal',
  'Portal Grovtest',
  'PortalProtect Login',
  'PortalProtect LoginAdmin',
  'PortalVD',
  'RydOpKomponentDB',
  'SA BankkontonrOpret',
  'SA BankproduktSaldoBidragHent',
  'SA BidragHent',
  'SA BidragOmfordel',
  'SA BidragsniveauHent',
  'SA Datamodel',
  'SA DokumentHent',
  'SA ErBidragsfordelingerFordeltPsl',
  'SA FastAkteringstekstListeHent',
  'SA FordelingOpret',
  'SA KapopsHent',
  'SA KorrespondanceListeHent',
  'SA KorrespondanceTilAkter',
  'SA KundeforholdStatusOpdater',
  'SA KundeFremsoeg',
  'SA KundeNrOpret',
  'SA KundenummerOpretFleksion',
  'SA ParkerKundeforhold',
  'SA PMFBidragOmfordel',
  'SA PmfErBidragsfordelingerFordelt',
  'SA PMFFordelingOpret',
  'SA PMFKundeforholdStatusOpdater',
  'SA PMFKundenummerOpretFleksion',
  'SA PMFProduktaftaleOpret',
  'SA ProduktaftaleDetaljerRepliker',
  'SA ProduktaftaleOpdater',
  'SA ProduktaftaleOpret',
  'SA ProduktKatalogHentFleksion',
  'SA SagstypeListeHent',
  'SA TegningsenhedOversigtHent',
  'SA ValoermaanedHent',
  'ScriptFolder',
  'ServicePortal AddUsersToSharepointGroups',
  'Serviceportal Data',
  'ServiceVindueApp',
  'SFTPRoot',
  'SFTPServer',
  'SFTPTransfer',
  'SFTPUser',
  'SILogDB_Update',
  'SkatteUdlaendinge',
  'SSIS_Catalog',
  'Staging Data',
  'Staging KDV',
  'Staging Load',
  'Staging ODBC',
  'Staging PAKS',
  'Staging Source',
  'Stamdata2Workzone',
  'Test web.config',
  'Transform2Neuron',
  'Transform2Neuron Logfolder Access',
  'Universal Agent',
  'UnixFTPApp',
  'Update-Helpers',
  'Update-Template',
  'VM Clone',
  'VM Snapshot',
  'VM Template',
  'VM_Cleanup',
  'WFS_Hotfix',
  'Windows Gadgets',
  'WorkZone PenSam klient',
  'Workzone2Eventlog',
  'xRM AddUsersToCrm',
  'xRM Import',
  'xRM Optimize',
  'xRM Run AddUsersToCRM',
  'xRM UserImportXml',
  'xRM Workflow'
]

appnames.each do |appname|
  app = App.find_or_create_by! name: appname
  av = Version.find_or_create_by! name: '1.0', deployable: app
  binfile = BinaryFile.find_or_create_by!(
              filename: av.parent.name + '_' + av.name + '.zip',
              path: av.parent.name,
              size: 10000000,
              share: share)
  Package.find_or_create_by! file: binfile, version: av
  ascfile = AsciiFile.find_or_create_by!(
              filename: '_install_app.ps1',
              path: av.parent.name,
              size: 1000,
              share: share)
  Script.find_or_create_by! file: ascfile, version: av
  ascfile = AsciiFile.find_or_create_by!(
              filename: appname + '.ini',
              path: av.parent.name,
              size: 1000,
              share: share)
  Template.find_or_create_by! file: ascfile, version: av, path: ''
  av = Version.find_or_create_by! name: '1.1', deployable: app
  binfile = BinaryFile.find_or_create_by!(
              filename: av.parent.name + '_' + av.name + '.zip',
              path: av.parent.name,
              size: 10000000,
              share: share)
  Package.find_or_create_by! file: binfile, version: av
  ascfile = AsciiFile.find_or_create_by!(
              filename: '_install_app.ps1',
              path: av.parent.name,
              size: 1000,
              share: share)
  Script.find_or_create_by! file: ascfile, version: av
  ascfile = AsciiFile.find_or_create_by!(
              filename: appname + '.ini',
              path: av.parent.name,
              size: 1000,
              share: share)
  Template.find_or_create_by! file: ascfile, version: av, path: ''
end

# -----------------------------------------------------------------



#dp = DeployPlan.create!(env_version: ev)
#    ai = Instance.create!(version: av, env_version: ev)
#    di = Instance.create!(version: dv, env_version: ev)
#    dla = DeployLog.create!(env_version: ev, deployed: false)
#    dld = DeployLog.create!(env_version: ev, deployed: false)
#    EntityLog.create!(instance: ai, deploy_log: dla)
#    EntityLog.create!(instance: di, deploy_log: dld)
#    if vernum.even?
#      DeployPlanItem.create!(
#        deploy_plan: dp,
#        instance: ai,
#        after_item: di
#      )
#      DeployPlanItem.create!(
#        deploy_plan: dp,
#        instance: di
#      )
#    else
#      DeployPlanItem.create!(
#        deploy_plan: dp,
#        instance: ai
#      )
#      DeployPlanItem.create!(
#        deploy_plan: dp,
#        instance: di,
#        after_item: ai
#      )
#    end
#  end
#end
