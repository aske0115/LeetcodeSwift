/**
 438. Find All Anagrams in a String
 Medium

 8787

 273

 Add to List

 Share
 Given two strings s and p, return an array of all the start indices of p's anagrams in s. You may return the answer in any order.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

  

 Example 1:

 Input: s = "cbaebabacd", p = "abc"
 Output: [0,6]
 Explanation:
 The substring with start index = 0 is "cba", which is an anagram of "abc".
 The substring with start index = 6 is "bac", which is an anagram of "abc".
 Example 2:

 Input: s = "abab", p = "ab"
 Output: [0,1,2]
 Explanation:
 The substring with start index = 0 is "ab", which is an anagram of "ab".
 The substring with start index = 1 is "ba", which is an anagram of "ab".
 The substring with start index = 2 is "ab", which is an anagram of "ab".
  

 Constraints:

 1 <= s.length, p.length <= 3 * 104
 s and p consist of lowercase English letters.
 Accepted
 615,008
 Submissions
 1,257,243
 */

class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        if s.sorted() == p.sorted() {
            return [0]
        }
        
        var greaterArray = s.count >= p.count ? s : p
        var lessArray = s.count < p.count ? s : p
        
        var count = lessArray.count
        
        
        var hashed = Dictionary(lessArray.map { ($0, 1) }, uniquingKeysWith: +).sorted { $0.value < $1.value }
        var sortedS = greaterArray.map { $0 }
        
        var resultArray: [Int] = []
        
        for i in 0...sortedS.count - count {
            let sorted = Array(sortedS[i..<i + count])
            let hash =  Dictionary(sorted.map { ($0, 1) }, uniquingKeysWith: +).sorted { $0.value < $1.value }

            let hashCount = hash.filter { (key,value) in
                hashed.contains { (k,v) in
                key == k && value == v
            } }.count

            if hashed.first!.value == hash.first!.value,  hashCount > 0 {
                resultArray.append(i)
            }
        }
        
        return resultArray
    }
}


print(Solution().findAnagrams("aaaaaaaaa", "aaaaaaaaaaaa"))
