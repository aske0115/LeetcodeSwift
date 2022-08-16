/*
 387. First Unique Character in a String
 Easy

 5978

 218

 Add to List

 Share
 Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.

  

 Example 1:

 Input: s = "leetcode"
 Output: 0
 Example 2:

 Input: s = "loveleetcode"
 Output: 2
 Example 3:

 Input: s = "aabb"
 Output: -1
  

 Constraints:

 1 <= s.length <= 105
 s consists of only lowercase English letters.
 */

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        
        let dic = Dictionary(s.map { ($0, 1)}, uniquingKeysWith: +).filter { $0.value == 1}.keys
        
        for (i,v)  in s.enumerated() {
            if dic.contains(v) {
                return i
            }
        }
        return -1
    }
}

let sol = Solution()
print(sol.firstUniqChar("leetcode"))
