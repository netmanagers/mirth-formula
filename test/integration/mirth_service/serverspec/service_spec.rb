require_relative '../../../kitchen/data/spec_helper'

describe 'mirth/service.sls' do
  describe file('/usr/lib/systemd/system/mirthconnect.service') do
    it { should be_file }
    its(:content) { should match('# This file is managed by salt.') }
  end

  describe service(mirthconnect) do
    it { should be_running }
  end
end
