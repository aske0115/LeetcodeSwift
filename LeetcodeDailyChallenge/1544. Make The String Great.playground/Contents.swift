/**
 1544. Make The String Great
 Easy
 1.3K
 63
 Companies
 Given a string s of lower and upper case English letters.
 
 A good string is a string which doesn't have two adjacent characters s[i] and s[i + 1] where:
 
 0 <= i <= s.length - 2
 s[i] is a lower-case letter and s[i + 1] is the same letter but in upper-case or vice-versa.
 To make the string good, you can choose two adjacent characters that make the string bad and remove them. You can keep doing this until the string becomes good.
 
 Return the string after making it good. The answer is guaranteed to be unique under the given constraints.
 
 Notice that an empty string is also good.
 
 
 
 Example 1:
 
 Input: s = "leEeetcode"
 Output: "leetcode"
 Explanation: In the first step, either you choose i = 1 or i = 2, both will result "leEeetcode" to be reduced to "leetcode".
 Example 2:
 
 Input: s = "abBAcC"
 Output: ""
 Explanation: We have many possible scenarios, and all lead to the same answer. For example:
 "abBAcC" --> "aAcC" --> "cC" --> ""
 "abBAcC" --> "abBA" --> "aA" --> ""
 Example 3:
 
 Input: s = "s"
 Output: "s"
 
 
 Constraints:
 
 1 <= s.length <= 100
 s contains only lower and upper case English letters.
 */


class Solution {
    func makeGood(_ s: String) -> String {
        var strArr = s.map { String($0) }
        
        func isGreatString(_ f: String, _ l: String) -> Bool {
            return f.lowercased() == l.lowercased()
        }
        
        func hasUpperCase(_ str: [String] ) -> Bool {
            return !str.filter { $0.first!.asciiValue! < 97 }.isEmpty
        }
        
        func replaceGreatString(_ s: [String]) -> [String] {
            var removeIndex:[Int] = []
            var result: [String] =  []
            for i in 0..<s.count - 1 {
                if (s[i].first!.isUppercase && !s[i+1].first!.isUppercase) || (!s[i].first!.isUppercase && s[i+1].first!.isUppercase), s[i].lowercased() == s[i+1].lowercased() {
                    removeIndex = [i,i+1]
                    break
                }
            }
        
            for i in 0..<s.count {
                if !removeIndex.contains(i) {
                    result.append(s[i])
                }
            }
            return result
        }
        
        while hasUpperCase(strArr) {
            let result = replaceGreatString(strArr)
            if strArr == result {
                break;
            }
            strArr =  replaceGreatString(strArr)
        }
        return strArr.isEmpty ? "" : strArr.joined(separator: "")
    }
}

print(Solution().makeGood("leEeetcode"))

print(Solution().makeGood("abBAcC"))
print(Solution().makeGood("s"))
print(Solution().makeGood("Pp"))
print(Solution().makeGood("mC"))
