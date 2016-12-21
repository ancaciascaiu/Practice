#Write an algorithm to determine if the characters in a string are unique

def unique?(string)
	unique_chars = {}
	string.each_char do |char|
		if char == " "
			next
		elsif unique_chars[char]
			return false
		elsif !unique_chars[char]
			unique_chars[char] = 1
		end
		p char
	end
	true
end

p unique?("Anca has a string.") #=>returns false
p unique?("Luv ya friend! ") #=>returns true
