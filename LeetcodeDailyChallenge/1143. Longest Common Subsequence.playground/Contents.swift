/**
 1143. Longest Common Subsequence
 Medium
 9.5K
 110
 Companies
 Given two strings text1 and text2, return the length of their longest common subsequence. If there is no common subsequence, return 0.

 A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.

 For example, "ace" is a subsequence of "abcde".
 A common subsequence of two strings is a subsequence that is common to both strings.

  

 Example 1:

 Input: text1 = "abcde", text2 = "ace"
 Output: 3
 Explanation: The longest common subsequence is "ace" and its length is 3.
 Example 2:

 Input: text1 = "abc", text2 = "abc"
 Output: 3
 Explanation: The longest common subsequence is "abc" and its length is 3.
 Example 3:

 Input: text1 = "abc", text2 = "def"
 Output: 0
 Explanation: There is no such common subsequence, so the result is 0.
  

 Constraints:

 1 <= text1.length, text2.length <= 1000
 text1 and text2 consist of only lowercase English characters.
 */


//using DP
// 못풀어서 해답봄.

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        if text1.isEmpty || text2.isEmpty { return 0 }
        guard 1 <= text1.count && text2.count <= 1000 else { return 0 }
        let a = Array(text1), b = Array(text2)
        var result = 0
        var dp = Array<[Int]>(repeating: [Int](repeating: 0, count: b.count+1), count: a.count+1)
        for i in 1...a.count {
            for j in 1...b.count {
                dp[i][j] = a[i-1] == b[j-1] ? dp[i-1][j-1] + 1 : max(dp[i-1][j], dp[i][j-1])
                result = max(result, dp[i][j])
            }
        }
        return result
    }
}
