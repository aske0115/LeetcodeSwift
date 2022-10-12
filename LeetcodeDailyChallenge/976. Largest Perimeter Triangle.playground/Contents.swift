/**
 976. Largest Perimeter Triangle
 Easy

 1725

 242

 Add to List

 Share
 Given an integer array nums, return the largest perimeter of a triangle with a non-zero area, formed from three of these lengths. If it is impossible to form any triangle of a non-zero area, return 0.

  

 Example 1:

 Input: nums = [2,1,2]
 Output: 5
 Example 2:

 Input: nums = [1,2,1]
 Output: 0
  

 Constraints:

 3 <= nums.length <= 104
 1 <= nums[i] <= 106
 Accepted
 128,458
 Submissions
 240,456
 */


class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        var sortedNums = nums.sorted()
        while !sortedNums.isEmpty {
            let first = sortedNums.removeLast()
            for j in stride(from : sortedNums.count - 1, through: 0, by: -1) {
                let second = sortedNums[j]
                if let third =  sortedNums[0..<j].last(where: { second + $0 > first}) {
                    return first + second + third
                }
            }
        }
        return 0
    }
}
