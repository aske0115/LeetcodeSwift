/*
 
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
