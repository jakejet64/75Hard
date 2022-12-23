/*
Given an integer array nums, return all the triplets
[nums[i], nums[j], nums[k]] such that i != j, i != k,
and j != k, and nums[i] + nums[j] + nums[k] == 0.

Notice that the solution set must not contain duplicate triplets.
*/

var threeSum = function(nums) {

  let combos = [];

  for(let i1 = 0; i1 < nums.length - 2; i1++) {
    for(let i2 = i1 + 1; i2 < nums.length - 1; i2++) {
      for(let i3 = i2 + 1; i3 < nums.length; i3++) {
        let arr = [nums[i1], nums[i2], nums[i3]];
        if(arr.reduce((a, b) => a + b) === 0
            && !combos.some(combo => combo.every(num => arr.includes(num)) && arr.every(num => combo.includes(num)))) {
          combos.push(arr);
        }
      }
    }
  }


  return combos;
};

console.log(threeSum([0,3,0,1,1,-1,-5,-5,3,-3,-3,0]));

