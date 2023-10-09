import Foundation
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {

        if let first = nums.firstIndex(where: { $0 == target}), let last = nums.lastIndex(where: { $0 == target}) {
            return [nums.distance(from: nums.startIndex, to: first), nums.distance(from: nums.startIndex, to: last)]
        } else {
            return [-1,-1]
        }
    }
}

class Solution2 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {

        var firstIndex: Int? {
            guard let index = nums.firstIndex(where: { $0 == target}) else { return nil }
            return nums.distance(from: nums.startIndex, to: index)
        }

        var lastIndex: Int? {
            guard let index = nums.lastIndex(where: { $0 == target}) else { return nil }
            return nums.distance(from: nums.startIndex, to: index)
        }

        if let firstIndex = firstIndex, let lastIndex = lastIndex {
            return [firstIndex, lastIndex]
        } else {
            return [-1,-1]
        }
    }
}

print(Solution().searchRange([1,3,3,3,5], 3))
print(Solution2().searchRange([1,3,3,3,5], 3))
