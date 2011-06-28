require 'mysql2'

class MysqlScout < Outpost::Scout
  expect(:response_code) do |scout,code|
    # Se você quiser criar lógicas como :less_than, etc,
    # aqui é o lugar
    scout.response_code == code
  end

  attr_reader :response_code

  def setup(options)
    @host = options[:host]
    @port = options[:port] || 3306
    @username = options[:username] || 'root'
    @password = options[:password] || ''
  end

  def execute
    client = Mysql2::Client.new(:host => @host,
                                :port => @port,
                                :username => @username,
                                :password => @password)
    results = client.query("SELECT 1")
    @response_code = 1
  rescue StandardError => e
    @response_code = -1
  end
end
