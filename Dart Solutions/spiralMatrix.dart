import 'dart:convert';

void main(List<String> arguments) {
  Solution s = new Solution();
  List<int> ans1 = s.spiralOrder([[1,2,3],[4,5,6],[7,8,9]]);
  print(jsonEncode(ans1) == '[1,2,3,6,9,8,7,4,5]');
  List<int> ans2 = s.spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]]);
  print(jsonEncode(ans2) ==   '[1,2,3,4,8,12,11,10,9,5,6,7]');

}


class Solution {
  List<int> spiralOrder(List<List<int>> matrix) {

    bool north = false;
    bool south = false;

    final List<int> ret = [];

    while(!(matrix.length == 0 || matrix[0].length == 0)) {
      if(south && north) { //west
        ret.addAll(matrix.removeLast().reversed);
        south = false;
      } else if(south) {
        matrix.forEach((row) => ret.add(row.removeLast()));
        north = true;
      } else if(north) {
        matrix.reversed.forEach((row) => ret.add(row.removeAt(0)));
        north = false;
      } else { // east
        ret.addAll(matrix.removeAt(0));
        south = true;
      }
    }

    return ret;
  }
}
