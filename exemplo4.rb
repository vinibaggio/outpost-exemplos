require_relative 'do_bundle' # versão do git do outpost
require 'outpost'
require 'outpost/scouts'

outpost_app = Outpost::Application.new
outpost_app.add_scout(Outpost::Scouts::Http => 'web server') do
  options :host => 'localhost', :port => 3000
  report :up, :response_code => 200
  report :down, :response_body => {:match => /Ops/}
end

p outpost_app.run
