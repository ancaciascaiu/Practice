// Create a function that takes two rectangles as parameters and returns true if the rectangles intersect, false otherwise. Assume that the (0,0) of the axis is the top left. (This is actually how iOS positions views in the screen). So a rectangle with origin (0,0), width 10 and height 20 would be on the top left corner taking 10 pixels to the right and 20 pixels down.

var rect1 = {
x: 20, y:30, width: 40, height: 11
};

var rect2 = {
x: 50, y:22, width: 26, height: 36
};

var rect3 = {
x: 10, y:10, width: 30, height: 20
};

var rect4 = {
x: 45, y:10, width: 12, height: 4
};

function intersection(rectangle1, rectangle2){
  // console.log(rectangle1.width); //this is for debugging
  //define the beginning and end point for each rectangle's X and Y coordinates
  var x1 = [rectangle1.x, rectangle1.x + rectangle1.width];
  // console.log(rangeX);
  var y1 = [rectangle1.y, rectangle1.y + rectangle1.height];
  var x2 = [rectangle2.x, rectangle2.x + rectangle2.width];
  var y2 = [rectangle2.y, rectangle2.y + rectangle2.height];
  //the logic I'm considering is that on each axis(X and Y), I need to check that the end point of a rectangle occurs before the other's beginning point. If at least one of the 4 conditions returns true, it means the 2 rectangles overlap.
  if (x1[1] < x2[0] || x2[1] < x1[0] || y1[1] < y2[0] || y2[1] < y1[0]){
    return false;
  } else {
    return true;
  }
}

intersection(rect1, rect2); //<= true
// intersection(rect3, rect2); //<= false
// intersection(rect1, rect3); //<= true
// intersection(rect3, rect4); //<= false