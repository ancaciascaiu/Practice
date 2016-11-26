# An element is compared to all the prior elements 
# until a lesser element is found. If an element contains 
# a value less than all the previous elements, it compares 
# the element to all the previous elements before going on 
# to the next comparison
# It uses recursion
# Big O:   O(N logN)

def merge_sort(array)
	if array.length <= 1
		array
	else	
		mid = array.length / 2
		array_left = merge_sort(array[0, mid])
		
		array_right = merge_sort(array[mid, array.length])
		
		p merge(array_left, array_right)
	end
end

def merge(left, right)
  output = []
  until left.empty? || right.empty?
      if left.first <= right.first
      	output << left.first
	    left.shift
	  else
	  	output << right.first
	    right.shift
	  end
  end
  output.concat(left).concat(right)
  
end

p merge_sort([1,5,2,8,3])
# p merge_sort([1,100,2,8,3,3,4,9,2,20])

# test method for iteration
def count_to_hundred
	100.times do |nr|
		p nr
	end

end

#test method for recursion
def recurse(n)
	return if n == 10
	p n 
	recurse(n+1)
	p "done"
end

# count_to_hundred
# recurse(0)


