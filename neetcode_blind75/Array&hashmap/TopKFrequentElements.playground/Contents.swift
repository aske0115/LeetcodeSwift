class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        
        var hashMap: [Int: Int] = [:]
        
        for i in nums {
            if let value = hashMap[i] {
                hashMap[i] = value + 1
            } else {
                hashMap[i] = 1
            }
        }
        let s = Dictionary(nums.map { ($0, 1)}, uniquingKeysWith: + )
        print(s)
        return hashMap.sorted { lhs, rhs in
            lhs.value > rhs.value
        }.prefix(k).map { $0.key }
    }
}

let sol = Solution()
print(sol.topKFrequent([-1,-1,2,4,1,3,2,4,5,7,8,8,8,8,8,7,6,3,2,4,5,6,6,4,4,3,1,1,1,1,1,1], 8))
