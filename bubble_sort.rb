# Buuble sort
# compare 2 numbers at a time and swap them if they are out of order
# loop in a loop
# Big O: O(N^2)


def bubble_sort(array)
	#outer loop keeps track if something was swapped or not
	loop do 
		swapped = false
		#inner loop swaps numbers that aren't in order
		(array.length-1).times do |i|
			#take each pair of numbers and compare them. Swap if a > b. If so, swapped = true.
  			if array[i] > array[i+1]
    			array[i], array[i+1] = array[i+1], array[i]
				swapped = true
			end
		end
		break if not swapped
	end
	array
end

p bubble_sort([1,2,3,6,4,8,5])
