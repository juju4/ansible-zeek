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

