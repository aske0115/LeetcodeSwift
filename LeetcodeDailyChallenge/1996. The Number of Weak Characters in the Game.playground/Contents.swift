/**
 1996. The Number of Weak Characters in the Game
 Medium

 1881

 63

 Add to List

 Share
 You are playing a game that contains multiple characters, and each of the characters has two main properties: attack and defense. You are given a 2D integer array properties where properties[i] = [attacki, defensei] represents the properties of the ith character in the game.

 A character is said to be weak if any other character has both attack and defense levels strictly greater than this character's attack and defense levels. More formally, a character i is said to be weak if there exists another character j where attackj > attacki and defensej > defensei.

 Return the number of weak characters.

  

 Example 1:

 Input: properties = [[5,5],[6,3],[3,6]]
 Output: 0
 Explanation: No character has strictly greater attack and defense than the other.
 Example 2:

 Input: properties = [[2,2],[3,3]]
 Output: 1
 Explanation: The first character is weak because the second character has a strictly greater attack and defense.
 Example 3:

 Input: properties = [[1,5],[10,4],[4,3]]
 Output: 1
 Explanation: The third character is weak because the second character has a strictly greater attack and defense.
  

 Constraints:

 2 <= properties.length <= 105
 properties[i].length == 2
 1 <= attacki, defensei <= 105
 */


class Solution {
    func numberOfWeakCharacters(_ properties: [[Int]]) -> Int {
        
        var properties = properties.sorted(by: {$0[0] < $1[0] || ($0[0] == $1[0] && $0[1] > $1[1] ) })
               print(properties)
               var maxTillNow = Int.min, count = properties.count
               var maxCount = 0
               
               for i in stride(from:count-1, through: 0, by: -1) {
                   print(properties[i][1] )
                   print(maxTillNow)
                   if properties[i][1] < maxTillNow {
                       maxCount+=1
                   }
                   
                   maxTillNow = max(properties[i][1],maxTillNow )
               }
               
               return maxCount
//        let sorted = properties.sorted { $0.first! < $1.first! }
//        var groupedArray: [[[Int]]] = []
//        var index = 0
//        var count = 0
//        for j in 0..<sorted.count {
//            if j != index {
//                continue
//            }
//
//            if let value = sorted[j].first, let firstIndex = sorted.firstIndex(where: { $0.first! != value} ) {
//                index = Int(firstIndex)
//                print(index)
//                groupedArray.append(Array(sorted[j..<index]))
//            }
//        }
//
//        print(groupedArray)
//        var findWeak = false
//        while groupedArray.count > 0 {
//            let group = groupedArray.removeFirst()
//            for i in group {
//                for k in groupedArray {
//                    for j in k {
//                        if i.last! < j.last! {
//                            count += 1
//                            findWeak = true
//                            break
//                        }
//                    }
//
//                    if findWeak {
//                        findWeak = false
//                        break
//                    }
//                }
//            }
//        }
//
//
//        return count
//
//        print(count)
//        print(sorted)
//        print(groupedArray)
        
        
//        var result: [Int] = []
//        for (i,j) in properties.enumerated()  {
//            if result.contains(i) {
//                continue
//            }
//
//            for (index,value) in properties.enumerated() {
//                if result.contains(index) {
//                    continue
//                }
//
//                if value.first! < j.first! && value.last! < j.last! {
//                    result.append(index)
//                }
//             }
//        }
//                return result.count
    }
}


let sol = Solution()
print(sol.numberOfWeakCharacters(
    [[7,7],[1,2],[9,7],[7,3],[3,10],[9,8],[8,10],[4,3],[1,5],[1,5]]))
