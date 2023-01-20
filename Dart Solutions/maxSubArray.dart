import 'dart:math';

void main(List<String> arguments) {
  Solution s = new Solution();
  int ans = s.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]);
  print(ans);
}


class Solution {
  int maxSubArray(List<int> nums) {
    int sol = nums[0];
    nums.reduce((acc, num) {
      if(acc > sol) {
        sol = acc;
      }
      return max(num, (acc + num));
    });
    return sol;
  }
}
