# Write a method that outputs the following pattern: (stairs)
#      *
#     *
#    *
#   *
#  *
# *
# it will take an argument, n, for how many stairs we want to build

def stairs(n)
	text_to_print = ""
	n.times do |line|
		text_to_print += (" " * (n-1)) + ("*" * (n-(n-1))) 
		text_to_print << "\n"
		n -= 1
	end
	text_to_print.split("\n").each{|line| puts line}
end

stairs(6)
