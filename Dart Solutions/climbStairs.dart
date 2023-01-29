/*
You are climbing a staircase. It takes n steps to reach the top.

Each time you can either climb 1 or 2 steps.
In how many distinct ways can you climb to the top?



Example 1:

Input: n = 2
Output: 2
Explanation: There are two ways to climb to the top.
1. 1 step + 1 step
2. 2 steps


Example 2:

Input: n = 3
Output: 3
Explanation: There are three ways to climb to the top.
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step


Constraints:

1 <= n <= 45
*/

void main(List<String> arguments) {
  Solution s = new Solution();
  print(s.climbStairs(5));
  var ans1 = s.climbStairs(38);
  print(ans1); // 28
  var ans2 = s.climbStairs(3);
  print(ans2 == 3); // 3

}

class Solution {
  Map<int, int> memoization = {};
  int climbStairs(int n) {
    memoization.putIfAbsent(n, () {
      int combinations = 1;
      for(int i = n - 2; i >= 0; i--) {
        combinations += climbStairs(i);
      }
      return combinations;
    });
    return memoization[n] ?? -1;
  }
}