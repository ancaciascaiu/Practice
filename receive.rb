#receiver for RabbitMQ
#Our consumer is pushed messages from RabbitMQ, so unlike the producer 
#which publishes a single message, we'll keep it running to listen for messages and print them out.

require "bunny"

#we open a connection and a channel, and declare the queue from which we're going to consume. Note this matches up with the queue that send publishes to.
conn = Bunny.new(:automatically_recover => false)
conn.start

ch = conn.create_channel
q  = ch.queue("hello")

begin
	#Note that we declare the queue here, as well. Because we might start the consumer before the producer, we want to make sure the queue exists before we try to consume messages from it.
	#We're about to tell the server to deliver us the messages from the queue. Since it will push us messages asynchronously, we provide a callback that will be executed when RabbitMQ pushes messages to our consumer. This is what Bunny::Queue#subscribe does.
	puts " [*] Waiting for messages in #{q.name}. To exit press CTRL+C"
	q.subscribe(:block => true) do |delivery_info, properties, body|
	  puts " [x] Received #{body}"

	  # cancel the consumer to exit
	  # delivery_info.consumer.cancel
	end
rescue Interrupt => _
	conn.close

	exit(0)
end