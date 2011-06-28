require 'outpost'
require 'outpost/scouts'

class HttpOutpostExample < Outpost::Application
  using Outpost::Scouts::Http => "web page" do
    options :host => 'localhost', :port => 3000
    report :up, :response_code => 200
    report :down, :response_body => {:match => /Ops/}
  end

  using Outpost::Scouts::Ping => 'ping' do
    options :host => 'localhost'
    report :up, :response_time => {:less_than => 1000}
  end
end

outpost = HttpOutpostExample.new

loop do
  p outpost.run
  sleep 2
end
