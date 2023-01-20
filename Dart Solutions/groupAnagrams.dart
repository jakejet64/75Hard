

void main(List<String> arguments) {
  Solution s = new Solution();
  List<List<String>> ans = s.groupAnagrams(["eat","tea","tan","ate","nat","bat"]);
  print(ans);
}


class Solution {
  List<List<String>> groupAnagrams(List<String> strs) {
    final occurrenceMapToWords = <String, List<String>>{};
    strs.forEach((str) {
      var occurMap = (str.split('')..sort()).join('');
      occurrenceMapToWords[occurMap] ??= [];
      occurrenceMapToWords[occurMap]?.add(str);
    });

    return [...occurrenceMapToWords.values];
  }
}