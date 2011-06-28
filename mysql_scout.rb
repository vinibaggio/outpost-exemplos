require 'mysql2'

class MysqlScout < Outpost::Scout
  attr_reader :response_code

  expect(:response_code) do |scout,code|
    scout.response_code == code
  end

  def setup(options)
    @host = options[:host] || 'localhost'
    @port = options[:port] || 3306
    @username = options[:username] || 'root'
    @password = options[:password] || ''
  end

  def execute
    client = Mysql2::Client.new(:host => @host,
                               :port => @port,
                               :username => @username,
                               :password => @password)

    client.query('SELECT 1')
    @response_code = 1
  rescue
    @response_code = -1
  end
end
