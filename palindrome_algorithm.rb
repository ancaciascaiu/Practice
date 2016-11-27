# A palindrome is a word, phrase, number, or other sequence of 
# characters which reads the same backward or forward, such as 
# madam or kayak. 

#iterative solution
def is_palindrome?(array)
	0..(array.length.to_f/2).ceil.times do |element|
		
	end
end


#recursive solution


is_palindrome?([1,2,3,4,3,2,1]) #=>true
is_palindrome?([5,6,7,7,6,5]) #=>true
is_palindrome?([7,8,9,0,9,8,7,6]) #=>false
is_palindrome?([1,2,3,3,2])