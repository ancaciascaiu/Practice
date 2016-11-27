# A palindrome is a word, phrase, number, or other sequence of 
# characters which reads the same backward or forward, such as 
# madam or kayak. 

#iterative solution
def is_palindrome?(array)
	n = 0
	#get half the length of the array, rounded up(to run through half plus one for odd length)
	half_length = (array.length.to_f/2).ceil
	#loop through half the array
	0..half_length.times do |element|
		#match first to last elem, then second to last but one, etc
		if array[n] != array[-(n+1)]
			#the first time they don't match, return false and terminate loop
			return false
		end
		n += 1
	end
	#otherwise, if all elements match in the array, return true
	true
end


#recursive solution
def recursive_palindrome?(array)
	n = 0
	if array[n] == array[-(n+1)]
	end
end


p is_palindrome?([1,2,3,4,3,2,1]) #=>true
p is_palindrome?([5,6,7,7,6,5]) #=>true
p is_palindrome?([7,8,9,0,9,8,7,6]) #=>false
p is_palindrome?([1,2,3,3,2,5,1]) #=>false

p recursive_palindrome?([1,2,3,4,3,2,1]) #=>true
p recursive_palindrome?([5,6,7,7,6,5]) #=>true
p recursive_palindrome?([7,8,9,0,9,8,7,6]) #=>false
p recursive_palindrome?([1,2,3,3,2]) #=>false
