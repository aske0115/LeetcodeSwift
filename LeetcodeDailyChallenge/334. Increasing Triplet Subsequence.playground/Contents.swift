/**
 334. Increasing Triplet Subsequence
 Medium
 
 4884
 
 237
 
 Add to List
 
 Share
 Given an integer array nums, return true if there exists a triple of indices (i, j, k) such that i < j < k and nums[i] < nums[j] < nums[k]. If no such indices exists, return false.
 
 
 
 Example 1:
 
 Input: nums = [1,2,3,4,5]
 Output: true
 Explanation: Any triplet where i < j < k is valid.
 Example 2:
 
 Input: nums = [5,4,3,2,1]
 Output: false
 Explanation: No triplet exists.
 Example 3:
 
 Input: nums = [2,1,5,0,4,6]
 Output: true
 Explanation: The triplet (3, 4, 5) is valid because nums[3] == 0 < nums[4] == 4 < nums[5] == 6.
 
 
 Constraints:
 
 1 <= nums.length <= 5 * 105
 -231 <= nums[i] <= 231 - 1
 
 
 Follow up: Could you implement a solution that runs in O(n) time complexity and O(1) space complexity?
 */

class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        guard nums.count > 2 else { return false }
        var visited: [Int] = []
        for i in 0..<nums.count - 2 {
           
            if visited.contains(nums[i]) {
                continue
            }
            visited.append(nums[i])
            let sliceArray = Array(nums[i..<nums.count].filter { $0 != nums[i]})
            var filtered = Set(sliceArray.filter { $0 > nums[i] }).sorted()
            if filtered.count > 0, let firstIndex = sliceArray.firstIndex(of: filtered.removeFirst()), let _ = sliceArray[firstIndex..<sliceArray.count].firstIndex(where: { $0 > sliceArray[firstIndex] } ) {
                return true
            }
        }
        return false
    }
}

print(Solution().increasingTriplet(
    [1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2]))
