
# input: string, paren map
# output: boolean which determines if the string contains balanced parentheses: (, ), [, ], {, } or other types

# "()" => True
# ")(" => False
# "[](){}" => True
# "[(])" => False
# "[({})]" => True

# "[({})][](){}[](){}[](){}"
# "((()))[][][]"

# parens: hash('(' => ')', '[' => ']', '{' => '}')

def check(string)
    closing_parens = [ ")", "]", "}" ]
    opening_parens = [ "(", "{", "[" ]
    pairs = { '(' => ')', '[' => ']', '{' => '}' }
	existing_opening_tags = []
	# p "This is my string: " + string
	string.each_char do |char|
		if opening_parens.include?(char)
			existing_opening_tags.push(char)
			# p "+++++++++"
			# p existing_opening_tags
		elsif closing_parens.include?(char)
			if pairs.key(char) == existing_opening_tags.last
				existing_opening_tags.pop
				# p "@@@@@@"
				# p existing_opening_tags
			else
				return false
			end
		end
	end

    if existing_opening_tags.empty?
    	return true
    end
    return false
        
end

p check("abcd(ef)g[]hij[(])klmn") #returns false
p check("abcd(ef)g[]hij[({})]klm(n(o()))p") #returns true

