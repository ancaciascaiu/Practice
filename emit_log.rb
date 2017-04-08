#!/usr/bin/env ruby
# encoding: utf-8

require "bunny"

conn = Bunny.new(:automatically_recover => false)
conn.start

ch   = conn.create_channel
x    = ch.fanout("logs") #Fanout broadcasts all the messages it 
						# receives to all the queues it knows

msg  = ARGV.empty? ? "Hello World!" : ARGV.join(" ")

x.publish(msg) #publish message to exchange
puts " [x] Sent #{msg}"

conn.close