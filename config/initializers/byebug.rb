if Rails.env.development?
  require 'byebug/core'
  #Byebug.wait_connection = true

  def find_available_port
    server = TCPServer.new(nil, 0)
    server.addr[1]
  ensure
    server.close if server
  end

  port = find_available_port

  puts "Starting remote debugger..."
  Byebug.start_server nil, port
  puts "Remote debugger on port #{port}"
end