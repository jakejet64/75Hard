/*
Given an m x n integer matrix matrix, if an element is 0,
set its entire row and column to 0's.

You must do it in place.



Example 1:


Input: matrix = [[1,1,1],[1,0,1],[1,1,1]]
Output: [[1,0,1],[0,0,0],[1,0,1]]
Example 2:


Input: matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
Output: [[0,0,0,0],[0,4,5,0],[0,3,1,0]]


Constraints:

m == matrix.length
n == matrix[0].length
1 <= m, n <= 200
-231 <= matrix[i][j] <= 231 - 1
*/

import 'dart:convert';

void main(List<String> arguments) {
  Solution s = new Solution();
  var ans1 = [[1,1,1],[1,0,1],[1,1,1]];
  s.setZeroes(ans1);
  print(jsonEncode(ans1) == '[[1,0,1],[0,0,0],[1,0,1]]');
  var ans2 = [[0,1,2,0],[3,4,5,2],[1,3,1,5]];
  s.setZeroes(ans2);
  print(jsonEncode(ans2) == '[[0,0,0,0],[0,4,5,0],[0,3,1,0]]');

}

class Solution {
  void setZeroes(List<List<int>> matrix) {

    List<bool> rows = List.filled(matrix.length, false);
    List<bool> cols = List.filled(matrix[0].length, false);

    for(int row = 0; row < rows.length; row++) {
      for(int col = 0; col < cols.length; col++) {
        if(matrix[row][col] == 0) {
          rows[row] = true;
          cols[col] = true;
        }
      }
    }

    for(int row = 0; row < rows.length; row++) {
      if(rows[row]) {
        for(int col = 0; col < cols.length; col++) {
          matrix[row][col] = 0;
        }
      } else {
        for(int col = 0; col < cols.length; col++) {
          if(cols[col]) {
            matrix[row][col] = 0;
          }
        }
      }
    }
  }
}