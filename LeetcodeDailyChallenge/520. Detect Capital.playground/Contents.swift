/**
 520. Detect Capital
 Easy
 3K
 430
 Companies
 We define the usage of capitals in a word to be right when one of the following cases holds:

 All letters in this word are capitals, like "USA".
 All letters in this word are not capitals, like "leetcode".
 Only the first letter in this word is capital, like "Google".
 Given a string word, return true if the usage of capitals in it is right.

  

 Example 1:

 Input: word = "USA"
 Output: true
 Example 2:

 Input: word = "FlaG"
 Output: false
  

 Constraints:

 1 <= word.length <= 100
 word consists of lowercase and uppercase English letters.
 */
class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        
        //check all character is UpperCase
        guard word != word.uppercased() else { return true }
        
        //check all character is LowerCase
        guard word.filter({ $0.isLowercase }).count != word.count else { return true }
        
        //Check that the first letter is uppercase and the rest of the letters are not uppercase
        let startIndex = word.index(word.startIndex, offsetBy: 1)
        return word.first!.isUppercase && word[startIndex..<word.endIndex].filter { $0.isUppercase }.count == 0
    }
}
