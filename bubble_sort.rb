# Buuble sort
# compare 2 numbers at a time and swap them if they are out of order
# loop in a loop


def bubble_sort(array)
	#outer loop keeps track if something was swapped or not
	swapped = false;
	until swapped == true do 
		#inner loop swaps numbers that aren't in order
		array.each_with_index do |number, index|
			#take each pair of numbers and compare them. Swap if a > b. If so, swapped = true.
			p array[index]
			p array[index + 1]
			p "@@@@"
			
			if index != array.length-1
				if array[index] > array[index + 1]
					array[index] == array[index + 1]
					array[index + 1] == array[index]
					swapped = true
					p array
				end
			end
		end
	end
end

p bubble_sort([1,2,3,6,4,8,5])
