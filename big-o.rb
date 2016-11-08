# Big O Notation tells you how complex is an algorithm depending on what you feed it.

# O(1) = the execution time of this algorithm is CONSTANT. 
# no matter how big our input is, it always takes the same amount of time to compute things.
def first_element_is_red?(array)
	array[0] == 'red' ? true : false
end

first_element_is_red?(['red', 'blue', 'green'])
first_element_is_red?(['red', 'blue', 'green', 'brown', 'orange', 'pink', 'yellow'])

# The "complexity" of this function is O(n) (order on n):
# it's a linear graph(straight line). 
# the execution time of an algorithm will grow LINEARLY depending on the input size: 

def item_in_list?(to_check, the_list)
	the_list.each do |element|
		if to_check == element
			return true
		end
	end
	false
end

item_in_list?(3, [1, 2, 3])
item_in_list?(202, [1, 2, 3, 5, 7, 9, 100, 111, 123, 146, 199, 200, 201, 202, 300])


# O(n^2)
# for each increment of the input size, the speed of the algorithm will double.
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
p all_combinations([1, 2, 3, 4, 5, 6])



















