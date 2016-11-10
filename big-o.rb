# Big O Notation tells you how complex is an algorithm depending on what you feed it.
# It is a way to express the speed of algorithms. 

# O(1) = the execution time of this algorithm is CONSTANT. 
# no matter how big our input is, it always takes the same amount of time to compute things.
# happens when we have no loops in the code
def first_element_is_red?(array)
	array[0] == 'red' ? true : false
end

first_element_is_red?(['red', 'blue', 'green'])
first_element_is_red?(['red', 'blue', 'green', 'brown', 'orange', 'pink', 'yellow'])


# The "complexity" of this function is O(N) (order of N):
# it's a linear graph(straight line). 
# for one increment of the input size, the speed of the execution will increase once (N)
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


# O(N^2)
# for each increment of the input size, the speed of the algorithm will double(will compute 2 things).
def all_combinations(the_list)
	results = []
	the_list.each do |item|
		the_list.each do |inner_item|
			results.push([item, inner_item])
		end
	end
	return results
end

all_combinations([1, 2, 3])
all_combinations([1, 2, 3, 4, 5, 6])

# O(log N)
# the search grows quickly at the beginning and then gets slower in time if we increase the size of the input
def binary_search(array, value, from=0, to=nil)
    to = array.count - 1 unless to
    mid = (from + to) / 2
 
    if value < array[mid]
        return binary_search(array, value, from, mid - 1)
    elsif value > array[mid]
        return binary_search(array, value, mid + 1, to)
    else
        return mid
    end
end 
 
p binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], 15)















