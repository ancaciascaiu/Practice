
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
    string.split("(") #output: list of parens
    open_parens = [ "(", "{", "[" ]
    #loop through list of parens  and match the opening tags, assign them to values with ordered nr keys
        Hash.new( 1=> "[" , 2=> "(" )
     end
     #loop through the list of parens and match the closing tags, & check against the output of the first loop
     
        
end


