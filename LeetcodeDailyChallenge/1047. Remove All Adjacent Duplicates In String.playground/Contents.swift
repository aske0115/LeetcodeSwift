/**
 1047. Remove All Adjacent Duplicates In String
 Easy
 4.2K
 182
 Companies
 You are given a string s consisting of lowercase English letters. A duplicate removal consists of choosing two adjacent and equal letters and removing them.

 We repeatedly make duplicate removals on s until we no longer can.

 Return the final string after all such duplicate removals have been made. It can be proven that the answer is unique.

  

 Example 1:

 Input: s = "abbaca"
 Output: "ca"
 Explanation:
 For example, in "abbaca" we could remove "bb" since the letters are adjacent and equal, and this is the only possible move.  The result of this move is that the string is "aaca", of which only "aa" is possible, so the final string is "ca".
 Example 2:

 Input: s = "azxxzy"
 Output: "ay"
  

 Constraints:

 1 <= s.length <= 105
 s consists of lowercase English letters.
 */


class Solution {
    func removeDuplicates(_ s: String) -> String {
        //using stack
        var stack:[String] = []
        for i in s {
            if let pop = stack.last, pop == String(i) {
                stack.removeLast()
            } else {
                stack.append(String(i))
            }
        }
        return stack.joined(separator:"")
    }
}
