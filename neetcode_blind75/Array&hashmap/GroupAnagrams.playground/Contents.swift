/*
 49. Group Anagrams
 Medium

 10928

 350

 Add to List

 Share
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

  

 Example 1:

 Input: strs = ["eat","tea","tan","ate","nat","bat"]
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
 Example 2:

 Input: strs = [""]
 Output: [[""]]
 Example 3:

 Input: strs = ["a"]
 Output: [["a"]]
  

 Constraints:

 1 <= strs.length <= 104
 0 <= strs[i].length <= 100
 strs[i] consists of lowercase English letters.
 */

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        
    var result: [[String]] = []
    var hashmap: [String: [Int]] = [:]

     strs.map { String($0.sorted()) }.enumerated().forEach {
      if let hashValue = hashmap[$0.element] {
        var array = [$0.offset]
        array.append(contentsOf: hashValue)
        hashmap[$0.element] = array
      } else {
        hashmap[$0.element] = [$0.offset]
      }
    }

    hashmap.values.forEach { indexes in
      var filteredResult: [String] = []
      for i in indexes {
        filteredResult.append(strs[i])
      }
      result.append(filteredResult)
    }

    return result
    }
}
