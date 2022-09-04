/**
 28. Find the Index of the First Occurrence in a String
 Medium

 53

 7

 Add to List

 Share
 Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

  

 Example 1:

 Input: haystack = "sadbutsad", needle = "sad"
 Output: 0
 Explanation: "sad" occurs at index 0 and 6.
 The first occurrence is at index 0, so we return 0.
 Example 2:

 Input: haystack = "leetcode", needle = "leeto"
 Output: -1
 Explanation: "leeto" did not occur in "leetcode", so we return -1.
  

 Constraints:

 1 <= haystack.length, needle.length <= 104
 haystack and needle consist of only lowercase English characters.
 */


class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        if haystack == needle {
            return 0
        }
        
        if haystack.count < needle.count {
            return -1
        }
        
        let needleCount = needle.count
        let stringArray = haystack.map { String($0) }
        
        for i in 0...stringArray.count - needleCount {
            let string = stringArray[i..<i+needleCount].joined(separator:"")
            if needle == string {
                return i
            }
        }
        return -1
    }
}
