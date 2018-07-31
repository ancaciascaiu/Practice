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

require 'paint'

def color_block(color)
  Paint['**', color, color]
end

COLORS = [:black, :red, :green, :yellow, :blue, :magenta, :cyan, :white]

def simple_bracelet(length, width, nr_of_colors)
	nr_of_threads = width + 1
	if nr_of_colors > nr_of_threads
		puts "Number of colors needs to be equal or less than width"
		return
  elsif nr_of_colors > COLORS.length
    puts "Number of colors must be less then #{COLORS.length}"
    return
	end

	chosen_colors = COLORS.sample(nr_of_colors).map { |color| color_block(color) }
	color_pattern = chosen_colors

	until color_pattern.length == width
		color_pattern << chosen_colors.sample
	end

	length.times do
		width.times do
			color_pattern.unshift(color_pattern.pop)
			puts color_pattern.join('')
		end
	end
end

simple_bracelet(3, 5, 3)
