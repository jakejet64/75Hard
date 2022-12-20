// Given an array of integers nums and an integer target,
// return indices of the two numbers such that they add up to target.

// You may assume that each input would have exactly one solution,
// and you may not use the same element twice.

// You can return the answer in any order.


var twoSum = function(nums, target) {
  let pointer1 = 0;
  let pointer2 = 1;
  while(nums[pointer1] + nums[pointer2] != target) {
      pointer2++;
      if(pointer2 >= nums.length) {
          pointer1++;
          pointer2 = pointer1 + 1;
      }
  }
  return [pointer1, pointer2];
};

console.log(twoSum([2,7,11,15], 9));