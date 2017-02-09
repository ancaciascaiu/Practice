//Given an array of numbers, assume that they are all different. Calculate the largest difference (subtraction) between any two numbers of the array.
// 1. Code in Javascript 2 solutions for this problem
// 2. Explain which one is better than the other one.

//1. start repl.it console and write code in it, because it's fast
//2. pseudocode to organize ideas:
  //The largest difference between 2 numbers in a collection of numbers will be between the SMALLEST and the LARGEST number. So, find the smallest and largest numbers and then make the difference between them.
  //Targeted type of operation: O(n) is the most efficient (fast) way to iterate/compute in an array, according to the Big O theory. Resource: http://bigocheatsheet.com/
  //My two chosen versions are: 
    //-sort the array and then make the difference between the first and last number
    //-store the "largest_so_far" and "smallest_so_far" number in a local variable at every index and make the difference between them at the end
//Write code:
//First version:
function differenceBySorting(array) {
  //.sort() has O(n log n) efficiency
  array.sort();
  console.log(array); // for debugging, to see what the array looks like after sorting
  //console.log( array[-1] ); <- this doesn't work. Solution on http://stackoverflow.com/questions/9050345/selecting-last-element-in-javascript-array
  return array[array.length-1] - array[0];
}

differenceBySorting([1,5,2,8,4,9,3,7,6]); //=>8



//Second version:
function differenceByStoringMaxMin(array) {
  //because we iterate just once, this solution has O(n) efficiency
  var largestSoFar = array[0];
  var smallestSoFar = array[0];
  //console.log(largestSoFar); 
  for (i = 0; i < array.length; i++ ){
    if (array[i] > largestSoFar) {
      largestSoFar = array[i];
    } 
    if (array[i] < smallestSoFar) {
      smallestSoFar = array[i];
    }
  }
  return largestSoFar - smallestSoFar;
}

differenceByStoringMaxMin([1,5,2,8,4,3,7,6]); //=>7

//Conclusions: 
  //Readability: The first one is more readable because I used the javascript method sort().
  //Performance: Both of these solutions work fast and the differences in performance are not significant for small inputs (arrays). The second version is more performant (especially for larger data inputs), because it solves the problem in one iteration (O(n)), whereas the first version solves it in multiple iterations(O(n log n)) performed by the sort() method.
