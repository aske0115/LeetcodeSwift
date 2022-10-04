/**
 844. Backspace String Compare
 Easy

 5605

 250

 Add to List

 Share
 Given two strings s and t, return true if they are equal when both are typed into empty text editors. '#' means a backspace character.

 Note that after backspacing an empty text, the text will continue empty.

  

 Example 1:

 Input: s = "ab#c", t = "ad#c"
 Output: true
 Explanation: Both s and t become "ac".
 Example 2:

 Input: s = "ab##", t = "c#d#"
 Output: true
 Explanation: Both s and t become "".
 Example 3:

 Input: s = "a#c", t = "b"
 Output: false
 Explanation: s becomes "c" while t becomes "b".
  

 Constraints:

 1 <= s.length, t.length <= 200
 s and t only contain lowercase letters and '#' characters.
  

 Follow up: Can you solve it in O(n) time and O(1) space?
 */


class Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        if s == t {
            return true
        }
        
        func sameCharacter(_ s: String) -> [Character]
        {
            var stack: [Character] = []
            for c in s {
                if c == "#" {
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                } else {
                    stack.append(c)
                }
            }
            return stack
        }
        
       
        return sameCharacter(s) == sameCharacter(t)
    }
}


print(Solution().backspaceCompare("y#fo##f", "y#f#o##f"))
