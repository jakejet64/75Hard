/*
A message containing letters from A-Z can be encoded into numbers using the following mapping:

'A' -> "1"
'B' -> "2"
...
'Z' -> "26"
To decode an encoded message, all the digits must be grouped then mapped back into letters using the reverse of the mapping above (there may be multiple ways). For example, "11106" can be mapped into:

"AAJF" with the grouping (1 1 10 6)
"KJF" with the grouping (11 10 6)
Note that the grouping (1 11 06) is invalid because "06" cannot be mapped into 'F' since "6" is different from "06".

Given a string s containing only digits, return the number of ways to decode it.

The test cases are generated so that the answer fits in a 32-bit integer.
*/
var numDecodings = function(s) {
  if (s[0] === '0') return 0; // If the first digit is '0', there are no valid decodings

  const n = s.length;
  const dp = new Array(n + 1).fill(0); // Create a dynamic programming array to store the number of decodings for each index
  dp[0] = 1; // There is one way to decode an empty string (base case)

  for (let i = 1; i <= n; i++) {
    const currentDigit = parseInt(s[i - 1]);
    const previousDigit = parseInt(s[i - 2] + s[i - 1]);

    // Check if the current digit can be decoded on its own
    if (currentDigit >= 1 && currentDigit <= 9) {
      dp[i] += dp[i - 1]; // The number of decodings at the current index is the same as the previous index
    }

    // Check if the current digit can be combined with the previous digit
    if (previousDigit >= 10 && previousDigit <= 26) {
      dp[i] += dp[i - 2]; // Add the number of decodings two positions ago to the current index
    }
  }

  return dp[n]; // Return the number of decodings for the entire string
};


console.log(numDecodings("226"));