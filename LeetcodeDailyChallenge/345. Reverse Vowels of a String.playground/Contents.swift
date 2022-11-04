/**
 345. Reverse Vowels of a String
 Easy
 2.2K
 2.1K
 Companies
 Given a string s, reverse only all the vowels in the string and return it.

 The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.

  

 Example 1:

 Input: s = "hello"
 Output: "holle"
 Example 2:

 Input: s = "leetcode"
 Output: "leotcede"
  

 Constraints:

 1 <= s.length <= 3 * 105
 s consist of printable ASCII characters.
 */


class Solution {
    func reverseVowels(_ s: String) -> String {
        var vowels: [String] = ["a","e","i","o","u"]
        var reverseString = s.reversed().map {String($0)}
        var resultString  = ""
        for i in s {
            if vowels.contains(String(i).lowercased()) {
                while !reverseString.isEmpty {
                    let first = reverseString.removeFirst()
                    if vowels.contains(first.lowercased()) {
                        resultString += first
                        break
                    }
                }
            } else {
                resultString += String(i)
            }
        }
        return resultString
    }
}
