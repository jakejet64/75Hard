/*
You are given an integer array nums.
You are initially positioned at the array's first index,
 and each element in the array represents your
  maximum jump length at that position.

Return true if you can reach the last index; false otherwise.




Example 1:

Input: nums = [2,3,1,1,4]
Output: true
Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.


Example 2:

Input: nums = [3,2,1,0,4]
Output: false
Explanation: You will always arrive at index 3 no matter what.
Its maximum jump length is 0, which makes it impossible to reach the last index.

*/
import 'dart:math';
void main(List<String> arguments) {
  Solution s = new Solution();
  var ans1 = s.canJump([2,3,1,1,4]);
  print(ans1 == true);
  var ans2 = s.canJump([3,2,1,0,4]);
  print(ans2 == false);

}

class Solution {
  bool canJump(List<int> nums) {
    int canJump = 0;
    for(int i = 0; i < nums.length - 1; i++) {
      canJump = max(canJump - 1, nums[i]);
      if(canJump == 0) return false;
    }
    return true;
  }
}