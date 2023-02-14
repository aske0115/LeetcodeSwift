/**
 67. Add Binary
 Easy
 6.8K
 702
 Companies
 Given two binary strings a and b, return their sum as a binary string.

  

 Example 1:

 Input: a = "11", b = "1"
 Output: "100"
 Example 2:

 Input: a = "1010", b = "1011"
 Output: "10101"
  

 Constraints:

 1 <= a.length, b.length <= 104
 a and b consist only of '0' or '1' characters.
 Each string does not contain leading zeros except for the zero itself.
 Accepted
 1M
 Submissions
 2M
 Acceptance Rate
 51.6%
 */


class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var aArray = Array(a)
        var bArray = Array(b)

        var aIndex = aArray.count - 1
        var bIndex = bArray.count - 1

        var result = ""
        var upper = false
        while aIndex >= 0  && bIndex >= 0 {
            
            if let number = aArray[aIndex].wholeNumberValue, let number2 = bArray[bIndex].wholeNumberValue, number == 1 && number2 == 1 {
                result.insert(upper ? "1" : "0", at: result.startIndex)
                upper = true
            } else if aArray[aIndex] == "0" && bArray[bIndex] == "0" {
                result.insert(upper ? "1" : "0", at: result.startIndex)
                upper = false
            } else {
                result.insert(upper ? "0" : "1", at: result.startIndex)
            }
            
            aIndex -= 1
            bIndex -= 1
        }

        while aIndex >= 0 {
            if aArray[aIndex] == "1" {
                result.insert(upper ? "0" : "1", at: result.startIndex)
            } else {
                result.insert(upper ? "1" : "0", at: result.startIndex)
                upper = false
            }
            aIndex -= 1
        }
        
        
        while bIndex >= 0 {
            if bArray[bIndex] == "1" {
                result.insert(upper ? "0" : "1", at: result.startIndex)
            } else {
                result.insert(upper ? "1" : "0", at: result.startIndex)
                upper = false
            }
            bIndex -= 1
        }
        
        if upper {
            result.insert("1", at: result.startIndex)
        }
        
        return String(result)
    }
}


print(Solution().addBinary("101111", "10"))
