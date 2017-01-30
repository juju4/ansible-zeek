require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('critical-stack-intel') do
  it { should be_installed }
end

describe file('/usr/bin/critical-stack-intel') do
  it { should be_executable }
end

## centos7: non-existing file after install (without API key)
describe file('/var/log/critical-stack-intel.log'), :if => os[:family] == 'ubuntu' do
  its(:size) { should > 0 }
  its(:content) { should_not match /\[ERROR\]/ }
end

