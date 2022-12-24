/*
There is an integer array nums sorted in ascending
order (with distinct values).

Prior to being passed to your function, nums is
possibly rotated at an unknown pivot index k
(1 <= k < nums.length) such that the resulting
array is [nums[k], nums[k+1], ..., nums[n-1],
nums[0], nums[1], ..., nums[k-1]] (0-indexed).

For example, [0,1,2,4,5,6,7] might be rotated
at pivot index 3 and become [4,5,6,7,0,1,2].

Given the array nums after the possible rotation
and an integer target, return the index of target
if it is in nums, or -1 if it is not in nums.

You must write an algorithm with O(log n) runtime complexity.
*/
import 'dart:math';

void main(List<String> arguments) {
  Solution s = new Solution();
  print(s.search([7,8,1,2,3,4,5,6], 2));
}

class Solution {
  int search(List<int> nums, int target) {

    if(nums.isEmpty) return -1;

    int s = 0;
    int m = (nums.length / 2).floor();
    int e = nums.length - 1;

    while(s <= e) {
      if(nums[s] <= nums[m]) { // left side is sorted
        if(nums[s] == target) return s;
        if(nums[m] == target) return m;
        if(nums[s] < target && target < nums[m]) {
          e = m - 1;
          m = ((e - s) / 2).floor() + s;
        } else {
          s = m + 1;
          m = ((e - s) / 2).floor() + s;
        }
      } else { // right side is sorted
        if(nums[e] == target) return e;
        if(nums[m] == target) return m;
        if(nums[m] < target && target < nums[e]) {
          s = m + 1;
          m = ((e - s) / 2).floor() + s;
        } else {
          e = m - 1;
          m = ((e - s) / 2).floor() + s;
        }
      }
    }
    return -1;
  }
}

// [2,4,5,6]
// [8,0,1,2,4,5,6]
// [6,7,8,2,4]