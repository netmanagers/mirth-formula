require_relative '../../../kitchen/data/spec_helper'

describe 'mirth/install.sls' do
  %w(java-1.7.0-openjdk-headless mirthconnect).each do |p|
    describe package(p) do
      it { should be_installed }
    end
  end

  describe file('/opt/mirthconnect') do
    it { should exist }
    it { should be_directory }
  end

  describe user('mirth') do
    it { should exist }
    it { should belong_to_group 'mirth' }
    it { should have_login_shell '/bin/bash' }
  end

  describe file('/home/mirth') do
    it { should_not exist }
  end
end
