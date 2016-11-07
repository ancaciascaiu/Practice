# Big O

# The "complexity" of this function is O(n) (order on n):
# it's a linear graph(straight line). If we graph the time it takes to run this function for 
# a 3 item array/ a 10,000 item array, we'd see that the time corresponds to the 
# number of items in the array:
# i.e. The further away in the list the number we're looking for, the longer it takes to find it.
def item_in_list(to_check, the_list)
	the_list.each do |element|
		if to_check == element
			return true
		end
	end
	false
end

item_in_list(3, [1, 2, 3])

# O(1) = called "constant time". 
# no matter how big our input is, it always takes the same amount of time to compute things.

def all_combinations(the_list)
	results = []
	the_list.each do |item|
		the_list.each do |inner_item|
			results.push([item, inner_item])
		end
	end
	return results
end

p all_combinations([1, 2, 3])



















