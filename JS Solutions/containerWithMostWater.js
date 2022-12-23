/*
You are given an integer array height of length n.
There are n vertical lines drawn such that the two
endpoints of the ith line are (i, 0) and (i, height[i]).

Find two lines that together with the x-axis form a container,
such that the container contains the most water.

Return the maximum amount of water a container can store.

Notice that you may not slant the container.
*/

var maxArea = function(height) {
  let max = 0;

  let left = 0;
  let right = height.length - 1;

  while(left !== right) {
    if(height[left] < height[right]) {
      max = Math.max(max, (right - left) * height[left]);
      left++;
    } else {
      max = Math.max(max, (right - left) * height[right]);
      right--;
    }
  }

  return max;
};

console.log(maxArea([1,8,6,2,5,4,8,3,7]));

//     [1,8,6,2,5,4,8,3,7]