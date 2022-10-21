/**
 219. Contains Duplicate II
 Easy

 3584

 2247

 Add to List

 Share
 Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.

  

 Example 1:

 Input: nums = [1,2,3,1], k = 3
 Output: true
 Example 2:

 Input: nums = [1,0,1,1], k = 1
 Output: true
 Example 3:

 Input: nums = [1,2,3,1,2,3], k = 2
 Output: false
  

 Constraints:

 1 <= nums.length <= 105
 -109 <= nums[i] <= 109
 0 <= k <= 105
 */


class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        guard k > 0 else { return false }

        if k == nums.count - 1 {
            return Set(nums).count != nums.count
        }
        
        var hashMap:[String:[Int]] = [:]
        
        for (i,v) in nums.enumerated() {
            if hashMap["\(v)"] != nil {
                hashMap["\(v)"]! += [i]
            } else {
                hashMap["\(v)"] = [i]
            }
        }
        
        var filteredHashMap = hashMap.filter { $0.value.count > 1 }.sorted { $0.value.count < $1.value.count}
        for j in filteredHashMap {
            for i in 0..<j.value.count - 1 {
                if abs(j.value[i] - j.value[i + 1]) <= k {
                    return true
                }
            }
        }
        return false
    }
}


print(Solution().containsNearbyDuplicate([1,2,3,1,2,3], 3))
