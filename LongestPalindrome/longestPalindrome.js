/*
Given a string s, return the longest
palindromic substring in s.
*/

var longestPalindrome = function(s) {
  for(let length = s.length; length > 0; length--) {
    for(let start = 0; start <= s.length - length; start++) {
      if(palindrome(s.substr(start, length))) {
        return s.substr(start, length);
      }
    }
  }
};

var palindrome = function(s) {
  for(let i = 0; i < s.length / 2; i++) {
    if(s.charAt(i) !== s.charAt(s.length - i - 1)) {
      return false;
    }
  }
  return true;
}

//console.log(longestPalindrome('babad'));