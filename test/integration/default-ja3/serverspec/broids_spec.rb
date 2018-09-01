require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('bro'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe package('bro'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe process('bro') do
  it { should be_running }
  it "is listening on port 47760" do
    expect(port(47760)).to be_listening
  end
end

describe file('/var/log/bro/current/stderr.log') do
  its(:size) { should > 0 }
  its(:content) { should match /listening on/ }
end
describe file('/var/log/bro/current/conn.log') do
  its(:size) { should > 0 }
end
#describe file('/var/log/bro/current/notice.log') do
#  its(:content) { should_not match /PacketFilter::Dropped_Packets/ }
#end
## Note: some logs might take time to fill...
#describe file('/var/log/bro/current/dns.log') do
#  its(:size) { should > 0 }
#end
#describe file('/opt/bro/logs/current/pdns.log') do
#  its(:content) { should_not match /Traceback/ }
#end
## only with opensuse package, xenial too
describe file('/var/log/bro/current/dns-passivedns.log'), :if => os[:family] == 'ubuntu' do
  its(:size) { should > 0 }
end
describe file('/var/log/bro/current/dns-passivedns.log'), :if => os[:family] == 'redhat' && os[:release] == '6' do
  its(:size) { should > 0 }
end
