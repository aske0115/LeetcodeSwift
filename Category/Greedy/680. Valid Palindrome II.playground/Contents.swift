/**
 680. Valid Palindrome II
 Easy
 6.8K
 351
 Companies
 Given a string s, return true if the s can be palindrome after deleting at most one character from it.

  

 Example 1:

 Input: s = "aba"
 Output: true
 Example 2:

 Input: s = "abca"
 Output: true
 Explanation: You could delete the character 'c'.
 Example 3:

 Input: s = "abc"
 Output: false
  

 Constraints:

 1 <= s.length <= 105
 s consists of lowercase English letters.
 */

class Solution {
    func validPalindrome(_ s: String) -> Bool {
        func isPalindrom(_ s: [String]) -> Bool {
            var first = 0
            var last = s.count - 1
            while first < last {
                if s[first] != s[last] {
                    return false
                } else {
                    first += 1
                    last -= 1
                }
            }
            return true
        }
        
        let stringArray = s.map { String($0) }
        var first = 0
        var last = stringArray.count - 1
        
        while first < last {
            if stringArray[first] != stringArray[last] {
                return isPalindrom(Array(stringArray[first + 1...last])) || isPalindrom(Array(stringArray[first...last - 1]))
            } else {
                first += 1
                last -= 1
            }
        }
        
        return true
    }
}


print(Solution().validPalindrome("atbbga"))
print(Solution().validPalindrome("abca"))
print(Solution().validPalindrome("aba"))
print(Solution().validPalindrome("bddb"))
print(Solution().validPalindrome("abc"))
