function accum(s) {
	var final = "";
  for (i = 0; i < s.length; i++){
    final += s[i].toUpperCase();
    if (i > 0){ 
      final += (s[i].toLowerCase().repeat(i));
      
    };
    if (i != (s.length-1)){
      final += "-";
    };
  };
  return final;
}

console.log(accum("abcd"));  // "A-Bb-Ccc-Dddd"
