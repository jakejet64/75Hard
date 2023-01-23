/*
There is a robot on an m x n grid.
The robot is initially located at the top-left corner (i.e., grid[0][0]).
The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]).
The robot can only move either down or right at any point in time.

Given the two integers m and n, return the number of possible unique paths
that the robot can take to reach the bottom-right corner.

The test cases are generated so that
the answer will be less than or equal to 2 * 109.


Example 1:


Input: m = 3, n = 7
Output: 28


Example 2:

Input: m = 3, n = 2
Output: 3
Explanation: From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
1. Right -> Down -> Down
2. Down -> Down -> Right
3. Down -> Right -> Down


Constraints:

1 <= m, n <= 100
*/

import 'dart:convert';

void main(List<String> arguments) {
  Solution s = new Solution();
  var ans1 = s.uniquePaths(3, 7);
  print(ans1); // 28
  var ans2 = s.uniquePaths(23, 12);
  print(ans2); // 3

}

class Solution {
  int uniquePaths(int m, int n) {
    if(n == 1 || m == 1) return 1;
    if(n > m) {
      int temp = n;
      n = m;
      m = temp;
    }
    if(n == 2) return m;
    if(m == 2) return n;
    List<int> arr = List.filled(n - 2, 1);
    for(int i = 1; i < m; i++) {
      arr[0]+= i + 1;
      for(int j = 1; j < arr.length; j++) {
        arr[j] += arr[j - 1];
      }
    }
    return arr.last;
  }
}




    // int paths = 0;
    // void innerRecurse(int r, int c) {
    //   if(r < m && c < n) {
    //     innerRecurse(r + 1, c);
    //     innerRecurse(r, c + 1);
    //   } else if(r < m) {
    //     innerRecurse(r + 1, c);
    //   } else if(c < n) {
    //     innerRecurse(r, c + 1);
    //   } else {
    //     paths++;
    //   }
    // }
    // innerRecurse(1, 1);
    // return paths;