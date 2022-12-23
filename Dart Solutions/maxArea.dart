import 'dart:math';

void main(List<String> arguments) {
  print(maxArea([1,8,6,2,5,4,8,3]));
}

int maxArea(List<int> height) {
  int maxSoFar = 0;

  int left = 0;
  int right = height.length - 1;

  while(left != right) {
    if(height[left] < height[right]) {
      maxSoFar = max(maxSoFar, (right - left) * height[left]);
      left++;
    } else {
      maxSoFar = max(maxSoFar, (right - left) * height[right]);
      right--;
    }
  }

  return maxSoFar;
}