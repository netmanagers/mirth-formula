require_relative '../../../kitchen/data/spec_helper'

describe 'mirth/config.sls' do
  %w(
    /path/to/appdata
    /tmp/mirthconnect
    /opt/mirthconnect/logs
  ).each do |d|
    describe file(d) do
      it { should be_directory }
      it { should be_owned_by 'mirth' }
      it { should be_grouped_into 'mirth' }
      it { should be_mode 755 }
    end
  end

  describe file('/opt/mirthconnect/conf/mirth.properties') do
    it { should be_file }
    its(:content) { should match('# This file is managed by salt. Manual changes risk being overwritten.') }
  end

  [
    'dir.appdata = /path/to/appdata',
    'dir.tempdata = /tmp/mirthconnect',
    'administrator.maxheapsize = 1g',
    'password.minlength = 8',
    'https.server.protocols = TLSv1.2,TLSv1.1,SSLv2Hello',
    'https.ciphersuites = TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_RSA_WITH_AES_256_GCM_SHA384',
    'database = postgres',
    'database.driver = your_custom_driver',
    'database.max-connections = 50',
    'database.url = jdbc:postgresql://your.db.host:5432/mirthdb',
    'database.username = mirthuser',
    'database.password = mirthpass',
  ].each do |t|
    describe file('/opt/mirthconnect/conf/mirth.properties') do
      its(:content) { should match(/#{t}/) }
    end
  end
end
