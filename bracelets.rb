# # simple bracelet:(min 2 colors, min 4 threads, any nr of threads)
# # knots:
# puts "X__"
# puts "OX_"
# puts "XOX"
# puts "OXO"
# puts "_OX"
# puts "__O"

# # chevron bracelet: (min 2 colors, min 4 threads, even nr of threads, half mirroring the other half)
# # knots:
# puts "X_X"
# puts "OXO"
# puts "XOX"
# puts "_X_"

# # triangle bracelet:(min 2 colors, min 4 threads)
# # knots:
# puts "X__"
# puts "XX_"
# puts "XXO"
# puts "XOX"
# puts "OXX"
# puts "XOX"
# puts "_XO"
# puts "__X"

#width = number of knots in a line. 
def simple_bracelet(length, width, nr_of_colors)
	nr_of_threads = width + 1
	if nr_of_colors > nr_of_threads
		puts "Number of colors needs to be equal or less than width"
		return
	end

	colors = ['X', 'O', 'A', 'Z', 'W', 'S', 'H'].sample(nr_of_colors)
	knots = colors

	until knots.length == width
		knots << colors.sample
	end

	length.times do |i| # 1 sequence
		width.times do |w|
			knots.unshift(knots.pop)
			puts knots.join(',')
		end
	end
end

simple_bracelet(3, 5, 2)
