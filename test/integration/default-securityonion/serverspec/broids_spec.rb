require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('securityonion-bro'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe process('bro') do
  it { should be_running }
  it "is listening on port 47760" do
    expect(port(47760)).to be_listening
  end
end

describe file('/opt/bro/logs/current/stderr.log') do
  its(:content) { should match /listening on/ }
end
describe file('/opt/bro/logs/current/conn.log') do
  its(:size) { should > 0 }
end
#describe file('/opt/bro/logs/current/pdns.log') do
#  its(:content) { should_not match /Traceback/ }
#end
describe file('/opt/bro/logs/current/dns-passivedns.log') do
  its(:size) { should > 0 }
end
