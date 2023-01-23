/*
Given an array of intervals where intervals[i] = [starti, endi],
 merge all overlapping intervals, and return an array of the
 non-overlapping intervals that cover all the intervals in the input.



Example 1:

Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].

Example 2:

Input: intervals = [[1,4],[4,5]]
Output: [[1,5]]
Explanation: Intervals [1,4] and [4,5] are considered overlapping.


Constraints:

1 <= intervals.length <= 104
intervals[i].length == 2
0 <= starti <= endi <= 104

*/

import 'dart:convert';
import 'dart:math';

void main(List<String> arguments) {
  Solution s = new Solution();
  List<List<int>> ans1 = s.merge([[1,3],[2,6],[8,10],[15,18]]);

  print(jsonEncode(ans1) + ' : [[1,6],[8,10],[15,18]]');
  List<List<int>> ans2 = s.merge([[1,4],[4,5]]);
  print(jsonEncode(ans2) + ' : [[1,5]]]');

}

class Solution {
  List<List<int>> merge(List<List<int>> intervals) {
    List<List<int>> ret = [];
    for(int i = 0; i < intervals.length; i++) {
      if(i == intervals.length - 1 || intervals[i][1] < intervals[i + 1][0]) {
        ret.add(intervals[i].toList());
      } else {
        ret.add([min(intervals[i][0], intervals[i + 1][0]), max(intervals[i][1], intervals[i + 1][1])]);
        i++;
      }
    }
    return ret;
  }
}