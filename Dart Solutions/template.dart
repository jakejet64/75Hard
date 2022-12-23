/*

*/
void main(List<String> arguments) {
  Solution s = new Solution();
  print(s.test(5));
}

class Solution {
  String test(int x) {
    String ret = '';
    for(int i = 0; i < x; i++) {
      ret += 'O';
    }
    return ret;
  }
}