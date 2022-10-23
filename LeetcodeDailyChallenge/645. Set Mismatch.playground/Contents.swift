/**
 645. Set Mismatch
 Easy

 2971

 707

 Add to List

 Share
 You have a set of integers s, which originally contains all the numbers from 1 to n. Unfortunately, due to some error, one of the numbers in s got duplicated to another number in the set, which results in repetition of one number and loss of another number.

 You are given an integer array nums representing the data status of this set after the error.

 Find the number that occurs twice and the number that is missing and return them in the form of an array.

  

 Example 1:

 Input: nums = [1,2,2,4]
 Output: [2,3]
 Example 2:

 Input: nums = [1,1]
 Output: [1,2]
  

 Constraints:

 2 <= nums.length <= 104
 1 <= nums[i] <= 104
 */

class Solution {
  func findErrorNums(_ nums: [Int]) -> [Int] {
        var dic = Dictionary( nums.map { ($0 , 1)}, uniquingKeysWith: +).filter { $0.value > 1 }.keys.first!
        var num = Array((1...nums.count))
        for i in num {
            if !nums.contains(i) {
                return [dic, i]
            }
        }
        return []
    }
}
