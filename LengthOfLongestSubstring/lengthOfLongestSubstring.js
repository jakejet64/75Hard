/*
Given a string s, find the length of the longest
substring without repeating characters.
*/

var lengthOfLongestSubstring = function(s) {
  let maxLength = 0;

  for(let start = 0; start < s.length; start++) {
    let obj = {};
    let length = 0;
    for(let i = start; i < s.length; i++) {
      if(obj[s.charAt(i)]) {
        i = s.length;
      } else {
        obj[s.charAt(i)] = true;
        length++;
      }
    }
    if(length > maxLength) {
      maxLength = length;
    }
  }

  return maxLength;
};