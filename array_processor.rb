# 1. If i is a multiple of 2 and i is greater than 0,
#      array[i] = array[i] + array[i - 1]
# 2. If i is a multiple of 3 and i is greater than 0 and i + 1 < L,
#      Swap array[i] and array[i + 1]
# 3. If i is a multiple of 5 and i is greater than 0,
#      array[i] = array[i] * 2
# 4. If i is a multiple of 7 or when no other rules apply,
#      array[i] = array[i] - 1

def processArray(array) 
	array.length.times do |i|
		if_applied = false
		if i % 2 == 0 && i > 0
			array[i] = array[i] + array[i-1]
			if_applied = true
		end
		if i % 3 == 0 && i > 0 && i < (array.length-1)
			temp = array[i]
			array[i] = array[i + 1]
			array[i+1] = temp
			if_applied = true
		end
		if i % 5 == 0 && i > 0
			array[i] = array[i] * 2
			if_applied = true
		end
		if i % 7 == 0 || !if_applied 
			array[i] = array[i] - 1
		end
	end
	array
end

p processArray([0,1,2,3,4]) #should give [-1, 0, 2, 4, 7]