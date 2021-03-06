#!/usr/bin/env ruby
# encoding: utf-8

require "bunny"

conn = Bunny.new(:automatically_recover => false)
conn.start

ch  = conn.create_channel
x   = ch.fanout("logs")
q   = ch.queue("", :exclusive => true) #make a random queue name.
#When the connection that declared it closes, the queue will be deleted because it is declared as exclusive.

q.bind(x) #That relationship between exchange and a queue is called a binding.

puts " [*] Waiting for logs. To exit press CTRL+C"

begin
  q.subscribe(:block => true) do |delivery_info, properties, body|
    puts " [x] #{body}"
  end
rescue Interrupt => _
  ch.close
  conn.close

  exit(0)
end