require_relative '../lib/grenache-ruby-ws.rb'

Grenache::Ws.configure do |conf|
   conf.grape_address = "ws://127.0.0.1:30001"
end

EM.run do
  client = Grenache::Ws.new
  10.times do |n|
    client.request("rpc_test","world #{n}") do |err, msg|
      if msg
        puts "response: #{msg.payload}"
      else
        puts "error: #{err}"
      end
    end
  end

end
