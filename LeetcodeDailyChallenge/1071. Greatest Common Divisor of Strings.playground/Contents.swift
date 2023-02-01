/**
 1071. Greatest Common Divisor of Strings
 Easy
 2K
 360
 Companies
 For two strings s and t, we say "t divides s" if and only if s = t + ... + t (i.e., t is concatenated with itself one or more times).

 Given two strings str1 and str2, return the largest string x such that x divides both str1 and str2.

  

 Example 1:

 Input: str1 = "ABCABC", str2 = "ABC"
 Output: "ABC"
 Example 2:

 Input: str1 = "ABABAB", str2 = "ABAB"
 Output: "AB"
 Example 3:

 Input: str1 = "LEET", str2 = "CODE"
 Output: ""
  

 Constraints:

 1 <= str1.length, str2.length <= 1000
 str1 and str2 consist of English uppercase letters.
 */

import Foundation

class Solution {
     func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        if str1.count < str2.count {
            return gcdOfStrings(str2, str1)
        } else if !str1.starts(with: str2) {
            return ""
        } else if str2.count == 0 {
            return str1
        } else {
            let range = str1.range(of: str2)!
            let tempStr = str1.replacingCharacters(in: range, with: "")
            return gcdOfStrings(str2, tempStr)
        }
    }
}
