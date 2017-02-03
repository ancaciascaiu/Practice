
# Write a program that takes input of N integers on a single line, separated by single spaces. The program should then print the number from the list that is closest to the average of the N integers in the list. If there is more than one solution, output the one that occurs first in the input list.

# Your output lines should not have any trailing or leading whitespaces

# Input:
# 1 2 3 4 6

# Output:
# 3

# Explanation: The average is 3.2 for {1,2,3,4,6}. Hence 3 is the closest to the average.  As a second example
# Input:
# 1 3 10 13 5 2

# Output:
# 5
# Explanation: The average is 5.6667 for {1,3,10,13,5,2}. Hence 5 is the closest to the average.


list = []
STDIN.read.split("\n").each do |a|
  list = a.split(" ").map {|nr| nr.to_i}
end

# p list

def closest_to_average(input)
  # calculate average
  average = 0

  input.map do |nr| 
    average += nr
  end
  average/=input.length
  # find the closest to the average number:
  # find the first larger number than average and compare its diff to the average to diff from the previous (smaller than average)
  input.sort!
  
  if input.include?(average)
    print average.to_i
    return average.to_i
  end
  
  input.each_with_index do |nr, index|
    if nr > average && (nr - average) < (average - input[index-1])
        print nr
        return nr
    else
        print input[index-1]
        return nr
    end
  end
end

closest_to_average(list)