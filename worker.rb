#!/usr/bin/env ruby
#Parallelizing work
#By default, RabbitMQ will send each message to the next consumer, 
# in sequence. On average every consumer will get the same number 
# of messages. This way of distributing messages is called round-robin.

require "bunny"

conn = Bunny.new(:automatically_recover => false)
conn.start

ch   = conn.create_channel
q    = ch.queue("task_queue", :durable => true) #durable tells RabbitMQ not to forget the queue even if the server stops.

# This tells RabbitMQ not to give more than one message to a worker 
# at a time. Or, in other words, don't dispatch a new message to a 
# worker until it has processed and acknowledged the previous one. 
# Instead, it will dispatch it to the next worker that is not still 
# busy:
ch.prefetch(1)
puts " [*] Waiting for messages. To exit press CTRL+C"

begin
  q.subscribe(:manual_ack => true, :block => true) do |delivery_info, properties, body|
    puts " [x] Received '#{body}'"
    # imitate some work
    sleep body.count(".").to_i
    puts " [x] Done"
    #this is for not losing a task while a worker quits during message processing. RabbitMQ will understand it needs to requeue the message and redistribute it to another worker.
    ch.ack(delivery_info.delivery_tag)
  end
rescue Interrupt => _
  conn.close
end
