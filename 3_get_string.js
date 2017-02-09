// Given the function assignment3 that calculates a number from a string. Find
// the string for which the number is: 667734139064 . The string has 7 characters
// and it can have repeated chars. The string has to be formed with the characters:
// "a","c","d","e","g","i","l","m","n","o","p","r","s","t","u","w".
//test function, string to number.
function assignment3(str) {
  var h = 7;
  var letters = ["a","c","d","e","g","i","l","m","n","o","p",
  "r","s","t","u","w"];
  for (var i = 0; i < str.length; i++) {
    var letter = str[i];
    var index = letters.indexOf(letter);
    h = (h * 37) + index;
  }
  return h;
}

assignment3('correct');  //<=returns the given number: 667734139064

// Solution:
  //I need to write a function that does the opposite of the test function written above. It should take a number as an argument and return a string.
  //Since h accumulates (itself * constant 37) and the only variable element in one execution of the loop is the index of the letter in the letters array, the opposite operation will include:
    //-use the modulus operator to find the remainder for the last letter in the string, which will be the index of the letter in the letters array
    //-use division to find the quotient that is used to start the next execution of the loop.
   
function getString(number) {
  var letters = ["a","c","d","e","g","i","l","m","n","o","p",
  "r","s","t","u","w"];
  var string = "";
  for (var i = 0; i < 7; i++) {
    // find the index of the last letter in the string
    var index = number % 37;
    // console.log(index); //I like to debug as I work
    //add the letter with the found index in front of the string variable
    string = letters[index] + string;
    // console.log(string);
    number = (number-index) / 37;
  }
  return string;
}

// getString(680131662011); //<= it works! it returns 'leepdag'
getString(667734139064); //<= returns "correct" 

// // // // // // // // // // // // //
// After refactoring....
function getString(number) {
  var letters = ["a","c","d","e","g","i","l","m","n","o","p",
  "r","s","t","u","w"];
  var string = "";
  var index = 0;
  for ( var n = number; n >= 37; n = (n - index)/37) {
    // find the index of the last letter in the string
   index = n % 37;
    // console.log(index); //I like to debug as I work
    //add the letter with the found index in front of the string variable
    string = letters[index] + string;
    // console.log(string);
    // number = (number-index) / 37;
  }
  return string;
}

