
def getMaxLakeVolume(heights, distances)
 i1 = 0
 largest_lake = 0
 c1 = 0
 c2 = 0
 heights.each do |height|
   total_distance = 1
   max_height = 0
   max_index = 0
   i2 = 0
   (heights.length - i1 - 1).times.each do |index|
     i2 = i1 + index + 1
     if heights[i2] > max_height
       max_height = heights[i2]
       max_index = i2
       total_distance += distances[i2-1] + 1
     end
   end
   lake_area = 0
   if heights[i1] > heights[max_index]
     lake_area = heights[max_index]*total_distance
   else
     lake_area = heights[i1]*total_distance
   end
   
   if lake_area > largest_lake
     largest_lake = lake_area+2
     c1 = i1
     c2 = max_index
   end
   i1 += 1
 end
 #p "area = #{largest_lake}, (#{c1}, #{c2})"

end

p getMaxLakeVolume([6,7,4,3,5], [1,1,4,2])