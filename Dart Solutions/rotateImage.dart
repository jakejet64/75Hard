/*
You are given an n x n 2D matrix representing
an image, rotate the image by 90 degrees (clockwise).

You have to rotate the image in-place,
which means you have to modify the input
2D matrix directly. DO NOT allocate another
2D matrix and do the rotation.
*/
import 'dart:convert';

void main(List<String> arguments) {
  Solution s = new Solution();

  List<List<int>> test1 = [[1,2,3],
                            [4,5,6],
                            [7,8,9]];

  List<List<int>> test2 = [[5,1,9,11],
                            [2,4,8,10],
                            [13,3,6,7],
                            [15,14,12,16]];

  List<List<int>> test3 = [[5,1,9,11,22],
                            [2,4,8,10,23],
                            [13,3,6,7,4],
                            [15,14,12,16,7],
                            [23,7,6,8,8]];

  List<List<int>> test4 = [[5,1,9,11,22,2],
                            [2,4,8,10,23,47],
                            [13,3,6,7,4,12],
                            [15,14,12,16,7,7],
                            [23,7,6,8,8,8],
                            [3,17,5,9,9,9]];

  s.rotate(test1);
  s.rotate(test2);
  s.rotate(test3);
  s.rotate(test4);

  print('Test 1: ${(jsonEncode(test1) == '[[7,4,1],[8,5,2],[9,6,3]]') ? 'Passed' : 'Failed'}');
  print(test1);
  print('Test 2: ${(jsonEncode(test2) == '[[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]') ? 'Passed' : 'Failed'}');
  print(test2);
}

class Solution {
  void rotate(List<List<int>> matrix) {
    for(int row = 0; row < (matrix.length / 2).floor(); row++) {
      for(int col = row; col < (matrix.length - row) - 1; col++) {
        int temp = matrix[row][col];
        matrix[row][col] = matrix[matrix.length - (col + 1)][row]; // north = west
        matrix[matrix.length - (col + 1)][row] = matrix[matrix.length - (row + 1)][matrix.length - (col + 1)]; // west = south
        matrix[matrix.length - (row + 1)][matrix.length - (col + 1)] = matrix[col][matrix.length - (row + 1)]; // south = east
        matrix[col][matrix.length - (row + 1)] = temp; // east = (saved) north
      }
    }
  }
}


// int north = matrix[row][col]
// int east = matrix[col][matrix.length - (row + 1)]
// int south = matrix[matrix.length - (row + 1)][matrix.length - (col + 1)]
// int west = matrix[matrix.length - (col + 1)][row]

//print({north, south, east, west});
