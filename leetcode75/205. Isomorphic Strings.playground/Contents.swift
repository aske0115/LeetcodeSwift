/**
 205. Isomorphic Strings
 Easy

 4851

 886

 Add to List

 Share
 Given two strings s and t, determine if they are isomorphic.

 Two strings s and t are isomorphic if the characters in s can be replaced to get t.

 All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.

  

 Example 1:

 Input: s = "egg", t = "add"
 Output: true
 Example 2:

 Input: s = "foo", t = "bar"
 Output: false
 Example 3:

 Input: s = "paper", t = "title"
 Output: true
  

 Constraints:

 1 <= s.length <= 5 * 104
 t.length == s.length
 s and t consist of any valid ascii character.
 */


class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var hashMapS:[String :  [Int]] = [:]
        var hashMapT:[String :  [Int]] = [:]
        
        for (i,v) in s.enumerated() {
            if let value = hashMapS[String(v)] {
                hashMapS[String(v)]?.append(i)
            } else {
                hashMapS[String(v)] = [i]
            }
        }
        
        for (i,v) in t.enumerated() {
            if let value = hashMapT[String(v)] {
                hashMapT[String(v)]?.append(i)
            } else {
                hashMapT[String(v)] = [i]
            }
        }
        
        let sortedHashMapS = hashMapS.sorted { $0.value.first! < $1.value.first! }
        let sortedHashMapT = hashMapT.sorted { $0.value.first! < $1.value.first! }

        print(sortedHashMapT)
        print(sortedHashMapS)
        for (i,v) in sortedHashMapS.enumerated() {
        
            if sortedHashMapT[i].value != v.value {
                return false
            }
        }
        return true
    }
}

let sol = Solution()
print(sol.isIsomorphic("paper", "title"))
