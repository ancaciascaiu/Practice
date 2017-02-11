// Given two integers, which can be positive and negative, find the sum of all the numbers between including them too and return it. If both numbers are equal return a or b.

// Note! a and b are not ordered!

function GetSum( a,b )
{
   //Good luck!
   var result = 0;
   if (a == b){
     return a;
   } else {
     if(a > b){
       var keep = a;
       a = b;
       b = keep;
     };
     
     result += a;
     if (a < 0){
       var nrLoops = b-a;
     }else{
       var nrLoops = b+a;
     };
     
     if (nrLoops == 1){
       result += b;
       return result;
      };
      console.log('a:', a)
      console.log('b:', b)
      console.log('nrLoops:', nrLoops)
     for(i = a+1; i < (nrLoops-1); i++){
       result += i;
       console.log(result);
     };
     return result;
   };
}

// console.log(GetSum(-2, 3)) //expected: 3