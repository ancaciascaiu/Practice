# Write an algorithm that performs basic string compression using the counts of repeated characters,
# where "aabbbccccaaa" would become "a2b3c4a3"

def string_compression(string)
	new_string = ""
	letter_count = 0
	string.each_char.with_index do |letter, index|
		#case 1: first letter
		if index == 0
			new_string += letter
			letter_count += 1
		#case 2: current letter is the same as the previous letter
		elsif letter == string[index-1]
			letter_count += 1
		#case 3: current letter is different than the previous letter
		else
			new_string += letter_count.to_s
			new_string += letter
			letter_count = 1 
		end
	end
	new_string
end

p string_compression("aabbbccccaaa")
