#Reverse the elements of an array in place.

def reverse(array)
	length = array.length
	n = 1
	array.each_with_index do |element, index|
		this_element = array[index]
		array[index] = array[length-1]
		array[length-1] = this_element
		n += 1 # where does it need to stop?
	end
	return array

end

p reverse(["a", "b", "c", "d", "e"])
