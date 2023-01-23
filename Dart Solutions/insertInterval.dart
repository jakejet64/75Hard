/*
You are given an array of non-overlapping intervals where
intervals[i] = [starti, endi] represent the start and the end of theith interval and
intervals is sorted in ascending order by starti.
You are also given an interval newInterval = [start, end]
that represents the start and end of another interval.

Insert newInterval into intervals such that intervals is
still sorted in ascending order by starti and intervals
still does not have any overlapping intervals
(merge overlapping intervals if necessary).

Return intervals after the insertion.



Example 1:

Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
Output: [[1,5],[6,9]]


Example 2:

Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
Output: [[1,2],[3,10],[12,16]]
Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].


Constraints:

0 <= intervals.length <= 104
intervals[i].length == 2
0 <= starti <= endi <= 105
intervals is sorted by starti in ascending order.
newInterval.length == 2
0 <= start <= end <= 105
*/

import 'dart:convert';
import 'dart:math';

void main(List<String> arguments) {
  Solution s = new Solution();
  var ans1 = s.insert([[1,3],[6,9]], [2,5]);
  print(jsonEncode(ans1) == '[[1,5],[6,9]]');
  var ans2 = s.insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8]);
  print(jsonEncode(ans2) ==   '[[1,2],[3,10],[12,16]]');

}

class Solution {
  List<List<int>> insert(List<List<int>> intervals, List<int> newInterval) {
    List<List<int>> ret = [];

    if(intervals.length == 0) return [newInterval.toList()];

    for(int i = 0; i < intervals.length; i++) {
      if(intervals[i].first < newInterval.first && newInterval.first > intervals[i].last) {
        ret.add(intervals[i].toList());
        if(i == intervals.length - 1) ret.add(newInterval.toList());
      } else if(intervals[i].first > newInterval.first && intervals[i].first > newInterval.last) {
        ret.add(newInterval.toList());
        while(i < intervals.length) {
          ret.add(intervals[i].toList());
          i++;
        }
      } else {
        newInterval = [min(intervals[i].first, newInterval.first), max(intervals[i].last, newInterval.last)];
        i++;
        while(i < intervals.length && newInterval.last >= intervals[i].first) {
          newInterval.last = max(newInterval.last, intervals[i].last);
          i++;
        }
        ret.add(newInterval);
        while(i < intervals.length) {
          ret.add(intervals[i].toList());
          i++;
        }
      }
    }

    return ret;
  }
}