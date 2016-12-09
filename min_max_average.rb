# write an algorithm that takes an array of unordered numbers and returns the min, max and average of the numbers

# handle exception: what if the array is empty?
# [7,2,3,4,9,6,5,8,1] should return "min: 1, max: 9, average: 5"

def min_max_average(array)
	results = {min: array[0], max: array[0], average: 0}
	array.each_with_index do |number, index|
		# p results.min
		if number < results[:min]
			results[:min] = number
		end
		if number > results[:max]
			results[:max] = number
		end
		results[:average] += number
	end
	results[:average] /= array.length
	results
end

p min_max_average([7,2,3,4,9,6,5,8,1])
