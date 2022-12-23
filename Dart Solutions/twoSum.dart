void main(List<String> arguments) {
  print(twoSum([1, 2, 3, 4, 5, 6, 7, 8, 9], 3));
}

List<int> twoSum(List<int> nums, int target) {
  int pointer1 = 0;
  int pointer2 = 1;
  while(nums[pointer1] + nums[pointer2] != target) {
      pointer2++;
      if(pointer2 >= nums.length) {
          pointer1++;
          pointer2 = pointer1 + 1;
      }
  }
  return [pointer1, pointer2];
}