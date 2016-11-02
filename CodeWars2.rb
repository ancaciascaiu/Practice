# You are given an array (which will have a length of at least 3,
#  but could be very large) containing integers. The array is 
# either entirely comprised of odd integers or entirely 
# comprised of even integers except for a single integer N. 
# Write a method that takes the array as an argument and returns N.

def find_outlier(integers)
  even_nr_enumerator = 0
  even_nr = 0
  odd_nr_enumerator = 0
  odd_nr = 0

  integers.each do |integer|
  	if integer % 2 == 0
  		even_nr = integer
  		even_nr_enumerator += 1
  	else
  		odd_nr = integer
  		odd_nr_enumerator += 1
  	end
  end

  if even_nr_enumerator == 1
  	return even_nr
  elsif odd_nr_enumerator == 1
  	return odd_nr
  else
  	return "There is no outlier in this collection of numbers"
  end
end

p find_outlier([0, 1, 2])
p find_outlier([1, 2, 3])
p find_outlier([2,6,8,10,3])