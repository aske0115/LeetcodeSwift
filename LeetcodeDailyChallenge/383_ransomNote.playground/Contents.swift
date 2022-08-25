/**
 383. Ransom Note
 Easy

 2513

 350

 Add to List

 Share
 Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.

 Each letter in magazine can only be used once in ransomNote.

  

 Example 1:

 Input: ransomNote = "a", magazine = "b"
 Output: false
 Example 2:

 Input: ransomNote = "aa", magazine = "ab"
 Output: false
 Example 3:

 Input: ransomNote = "aa", magazine = "aab"
 Output: true
  

 Constraints:

 1 <= ransomNote.length, magazine.length <= 105
 ransomNote and magazine consist of lowercase English letters.
 */
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
       
        var mag = magazine
        
        for i in ransomNote {
            if !mag.contains(i) {
                return false
            }
            if let index = mag.firstIndex(of: i) {
                mag.remove(at: index)
            }
        }
        
        return true
        
        
        let magazineCount = Dictionary(magazine.map { ($0,1)} , uniquingKeysWith: +)
        let ransomNoteCount = Dictionary(ransomNote.map { ($0,1)} , uniquingKeysWith: +)
        for (key,value) in ransomNoteCount {
            if !magazineCount.keys.contains(key) ||  magazineCount[key]! < value {
                return false
            }
        }
        return true
    }
}


let sol = Solution()
sol.canConstruct("aa", "$ab")

