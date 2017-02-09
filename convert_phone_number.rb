#convert a phone number into meaningful letters

numbers = {
	"1" => nil,
	"2" => ["a", "b", "c"],
	"3" => ["d", "e", "f"],
	"4" => ["g", "h", "i"],
	"5" => ["j", "k", "l"],
	"6" => ["m", "n", "o"],
	"7" => ["p", "q", "r", "s"],
	"8" => ["t", "u", "v"],
	"9" => ["w", "x", "y", "z"]
}

def convert(number)
	
	dict = File.open('/usr/share/dict/words', 'r') do |f1|  
	  while line = f1.gets  
	  	
	    return line 
	    
	  end  
	end  
end

p convert('7735012982')
