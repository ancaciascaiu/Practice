#sender for RabbitMQ
#!!!send and receive messages from a named queue
#The sender will connect to RabbitMQ, send a single message, then exit.
require "bunny"

#connect to RabbitMQ server
conn = Bunny.new(:automatically_recover => false)
conn.start
#create a channel, which is where most of the API for getting things done resides:
ch = conn.create_channel
# To send, we must declare a queue for us to send to; then we can publish a message to the queue:
q = ch.queue("hell")
ch.default_exchange.publish("Hello World!", :routing_key => q.name)
puts " [x] Sent 'Hello World!'"
conn.close