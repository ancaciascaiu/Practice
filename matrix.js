// Input Matrix
// 1 0 0 1
// 0 0 1 0
// 0 0 0 0
// Matrix after modification
// 1 1 1 1
// 1 1 1 1
// 1 0 1 1

var setZeros = function(matrix){
	//to remember which columns we need to fill with 1's

	if(matrix.length == 0)
		return;

	var rows = [];
	var columns = [];



	for(i=0; i<(matrix.length); i++){
		var colLength = matrix[i].length
		// console.log(matrix[i])
		for(j=0; j<colLength; j++){
			// console.log(matrix[i][j])
			if(matrix[i][j]==1){
				//if element is 1, note which row and column we need to fill with 1's
				rows.push(i);
				columns.push(j);
			}
		}
	}
	columns.sort();
	console.log("Rows:", rows)
	console.log("Columns:", columns)

	//fill matrix with 1's on rows and columns
	for(i=0; i<rows.length; i++){
		matrix[rows[i]].fill(1)
	}

	for(i=0; i<matrix.length; i++){
		for(j = 0; j<matrix[i].length; j++){
			if(columns.includes(j)){
				matrix[i][j] = 1
			}
		}
	}

	console.log(matrix)
}

setZeros([[1,0,0,1], [0,0,1,0], [0,0,0,0]]) //<-returns [[ 1, 1, 1, 1 ], [ 1, 1, 1, 1 ], [ 1, 0, 1, 1 ]]

