/*
Given an array of distinct integers candidates
and a target integer target, return a list of
all unique combinations of candidates where
the chosen numbers sum to target. You may return
the combinations in any order.

The same number may be chosen from candidates
an unlimited number of times. Two combinations
are unique if the frequency of at least one of
the chosen numbers is different.

The test cases are generated such that the number
of unique combinations that sum up to target is less
than 150 combinations for the given input.
*/

void main(List<String> arguments) {
  Solution s = new Solution();

  print(s.combinationSum([2,3,6,7], 7)); // [[2,2,3],[7]]
  print(s.combinationSum([2,3,5], 8)); // [[2,2,2,2],[2,3,3],[3,5]]
  print(s.combinationSum([2], 1)); // []

}


class Solution {
  List<List<int>> combinationSum(List<int> candidates, int target) {
    List<List<int>> result = [];
    List<int> current = [];
    _combinationSum(candidates, target, 0, current, result);
    return result;
  }

  void _combinationSum(List<int> candidates, int target, int start, List<int> current, List<List<int>> result) {
    if (target == 0) {
      result.add(current);
      return;
    }

    for (int i = start; i < candidates.length; i++) {
      if (candidates[i] > target) {
        continue;
      }
      current.add(candidates[i]);
      _combinationSum(candidates, target - candidates[i], i, new List.from(current), result);
      current.removeLast();
    }
  }
}