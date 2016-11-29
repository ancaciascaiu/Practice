def modify(string)
	if string[-1] == " "
		string.chop!
	end
	if string.include?(" ")
		string.gsub!(" ", "%20")
	end
	string
end

p modify("abc def ghi ")
