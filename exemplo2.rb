require 'outpost'
require 'outpost/scouts'
require 'outpost/notifiers'

require_relative 'email_settings'

class HttpOutpostExample < Outpost::Application
  notify Outpost::Notifiers::Email, {
    :from => 'outpost@vinibaggio.net',
    :to   => 'vinibaggio@gmail.com'
  }

  using Outpost::Scouts::Http => "web page" do
    options :host => 'localhost', :port => 3000
    report :up, :response_code => 200
    report :down, :response_body => {:match => /Ops/}
  end
end

loop do
  outpost = HttpOutpostExample.new
  outpost.run
  outpost.notify
  sleep 5
end
