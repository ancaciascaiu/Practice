#!/usr/bin/env ruby
#!!!Work Queue (aka Task Queue) that will be used to distribute 
# time-consuming tasks among multiple workers.
# The main idea behind Work Queues (aka: Task Queues) is to avoid doing 
# a resource-intensive task immediately and having to wait for it to 
# complete. Instead we schedule the task to be done later. We encapsulate
# a task as a message and send it to a queue. A worker process running 
# in the background will pop the tasks and eventually execute the job. 
# When you run many workers the tasks will be shared between them.

require "bunny"

conn = Bunny.new(:automatically_recover => false)
conn.start

ch   = conn.create_channel
q    = ch.queue("task_queue", :durable => true)

msg  = ARGV.empty? ? "Hello World!" : ARGV.join(" ")

q.publish(msg, :persistent => true) #persistent assures that the queue won't be lost even if RabbitMQ server restarts. It doesnt fully guarantee this, though.
puts " [x] Sent #{msg}"

conn.close

#messages will be sent alternatively to consumers (one to each)
