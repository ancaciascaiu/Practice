# Big O

# The "complexity" of this function is O(n) (order on n):
# it's a linear graph(straight line). If we graph the time it takes to run this function for 
# a 3 item array/ a 10,000 item array, we'd see that the time corresponds to the 
# number of items in the array:
def item_in_list(to_check, the_list)
	the_list.each do |element|
		if to_check == element
			return true
		end
	end
	false
end

p item_in_list(3, [1, 2, 3])


