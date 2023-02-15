/**
 989. Add to Array-Form of Integer
 Easy
 1.9K
 175
 Companies
 The array-form of an integer num is an array representing its digits in left to right order.

 For example, for num = 1321, the array form is [1,3,2,1].
 Given num, the array-form of an integer, and an integer k, return the array-form of the integer num + k.

  

 Example 1:

 Input: num = [1,2,0,0], k = 34
 Output: [1,2,3,4]
 Explanation: 1200 + 34 = 1234
 Example 2:

 Input: num = [2,7,4], k = 181
 Output: [4,5,5]
 Explanation: 274 + 181 = 455
 Example 3:

 Input: num = [2,1,5], k = 806
 Output: [1,0,2,1]
 Explanation: 215 + 806 = 1021
  

 Constraints:

 1 <= num.length <= 104
 0 <= num[i] <= 9
 num does not contain any leading zeros except for the zero itself.
 1 <= k <= 104
 */


class Solution {
    func addToArrayForm(_ num: [Int], _ k: Int) -> [Int] {
        var result = num
        var kNum = String(k).compactMap { $0.wholeNumberValue }.reversed()
        var numIndex = num.count - 1
        var upper = false
        
        for i in kNum {
            let sum = (numIndex > -1 ? result[numIndex] : 0) + i + (upper ? 1 : 0)
            upper = sum > 9
            let value = upper ? sum % 10 : sum
            if numIndex > -1 {
                result[numIndex] = value
            } else {
                result.insert(value, at: result.startIndex)
            }
            numIndex -= 1
        }
        
        while upper && numIndex >= 0 {
            if result[numIndex] > 8 {
                result[numIndex] = 0
            } else {
                result[numIndex] += 1
                upper = false
            }
            numIndex -= 1
        }
        
        if upper {
            result.insert(1, at: result.startIndex)
        }
        
        return result
    }
}


print(Solution().addToArrayForm([0], 23))
