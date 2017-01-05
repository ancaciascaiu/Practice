#for a string and a number given as arguments, count how many characters appear the number of times given by the number in the argument or a multiple number of times

def  countCharacters( strings,  multiples) 
	index = 0
	result = []
	strings.each do |str|
		char_counter = {}
		str.each_char do |char|
			if char_counter.has_key?(char)
				char_counter[char] += 1
			else
				char_counter[char] = 1
			end
		end
		repetition_counter = 0
		char_counter.values.each do |val|
			if val % multiples[index] == 0
				repetition_counter += 1
			end

		end
		result << repetition_counter
		index += 1
	end
	result
end

p countCharacters(['aababcabcd', 'aababcabcd'], [3,2]) # output: [1,2]