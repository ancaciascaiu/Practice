# Write a program that takes two lines as input:

# A list of integers separated by spaces
# A target integer
# And prints out all of the pairs of numbers from the input list that sum to the target integer.  For example,

# 2 3 7 4 5 9 1
# 5
# Should print

# 1 4
# 2 3
# Use each number in the list only one time.  For example: 

# 2 3 1 1 3 1 2 2
# 4
# Should print

# 1 3
# 1 3
# 2 2
# Notes:

# The size of the input list can be up to 100 elements
# Order each pair in the output with the smallest number first
# Order the lines so that the smallest first numbers are in the first lines (i.e. between "1 3" and "2 2", the line "1 3" should be printed first)
#  

arguments = []
STDIN.read.split("\n").each do |a|
#   puts a.class => String
  a = a.split(" ")
  a.map! {|nr| nr.to_i}
  arguments << a
end
# p arguments[0]


def pairs_of_numbers(int_list, target_int)
  int_list.sort!
#   p target_int
  # bubble loop checks each number to sum up into target_int , with each of the other numbers in the array
  
  int_list.each_with_index do |int, index|
    out_index = index
    #inner loop checks each of the other numbers
    int_list.each_with_index do |other_int, index=(out_index+1)|
      #take each pair of numbers and compare them. 
      if int + other_int == target_int && int <= other_int
        print int, " ", other_int, "\n"
        int_list.delete(int)
        int_list.delete(other_int)
      elsif int + other_int == target_int && int > other_int
        print other_int, " ", int, "\n"
        int_list.delete(int)
        int_list.delete(other_int)
      end
        
#       puts  "int:",int, ", other int:", other_int
    end
  end

end


pairs_of_numbers(arguments[0], arguments[1][0])


