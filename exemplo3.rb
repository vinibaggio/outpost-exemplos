require 'outpost'

require_relative 'mysql_scout'

class MysqlOutpostExample < Outpost::Application
  using MysqlScout => "database" do
    # defaults são OK
    report :up, :response_code => 1
    report :down, :response_code => -1
  end
end
loop do
outpost = MysqlOutpostExample.new
p outpost.run
sleep 1
end
