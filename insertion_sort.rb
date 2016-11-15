# An element is compared to all the prior elements until 
# a lesser element is found. In other words, if an element 
# contains a value less than all the previous elements, 
# it compares the element to all the previous elements 
# before going on to the next comparison

def insertion_sort(array)
	# outer loop iterates through all elements of the array
	array.each_with_index do |val, i|
		# inner loop compares val to previous val until previous val < val
		j = i - 1 # previous index
		while j >= 0
			break if array[i] > array[j]
			array[i] = array[j]
			j -= 1
		end
		array[j + 1] = val
	end
	array
end

p insertion_sort([1,5,8,2,4,9,3,7,0,6])




