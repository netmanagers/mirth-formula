require_relative '../../../kitchen/data/spec_helper'

describe 'mirth/install.sls' do
  %w(java-1.7.0-openjdk-headless mirthconnect).each do |p|
    describe package(p) do
      it { should be_installed }
    end
  end
end
