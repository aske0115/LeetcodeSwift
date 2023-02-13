
/**
 942. DI String Match
 Easy
 2.1K
 840
 Companies
 A permutation perm of n + 1 integers of all the integers in the range [0, n] can be represented as a string s of length n where:

 s[i] == 'I' if perm[i] < perm[i + 1], and
 s[i] == 'D' if perm[i] > perm[i + 1].
 Given a string s, reconstruct the permutation perm and return it. If there are multiple valid permutations perm, return any of them.

  

 Example 1:

 Input: s = "IDID"
 Output: [0,4,1,3,2]
 Example 2:

 Input: s = "III"
 Output: [0,1,2,3]
 Example 3:

 Input: s = "DDI"
 Output: [3,2,0,1]
  

 Constraints:

 1 <= s.length <= 105
 s[i] is either 'I' or 'D'.
 */

class Solution {
    func diStringMatch(_ s: String) -> [Int] {
        var iVal = 0
        var dVal = s.count

        var result = [Int]()
        for i in s {
            if i == "I" {
                result.append(iVal)
                iVal += 1
            } else {
                result.append(dVal)
                dVal -= 1
            }
        }
        if let last = s.last, last == "I" {
            result.append(iVal)
        } else {
            result.append(dVal)
        }
        
        return result
    }
}

print(Solution().diStringMatch("DDI"))
