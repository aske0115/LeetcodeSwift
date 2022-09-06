/**
 14. Longest Common Prefix
 Easy

 10098

 3354

 Add to List

 Share
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".

  

 Example 1:

 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 Example 2:

 Input: strs = ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
  

 Constraints:

 1 <= strs.length <= 200
 0 <= strs[i].length <= 200
 strs[i] consists of only lowercase English letters.
 */


class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var resultString: String = ""
        
        //zip하나 배워감..
        for (char1, char2) in zip(strs.first!, strs.last!) {
            if char1 == char2 {
                resultString += String(char1)
            } else {
                break
            }
        }
        
       //아래는 내가 짠 코드
//        if let first = strs.first {
//            let array = first.map { String($0) }
//            for i in 0..<array.count {
//                let str = array[0...i].joined(separator: "")
//                if strs[1..<strs.count].filter { !$0.hasPrefix(str)}.count != 0 {
//                    return resultString
//                }
//                resultString = str
//            }
//        }
        
        return resultString
    }
}

let sol = Solution()
print(sol.longestCommonPrefix(["flower","flow","flight"]))
