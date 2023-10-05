import Foundation


class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        Dictionary(nums.map { ($0, 1) }, uniquingKeysWith: +).filter { $0.value > (nums.count / 3)}.keys.compactMap { Int($0) }
    }
}

print(Solution().majorityElement([1,2]))
