class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        
        var sortedArrayy = nums
        var resultArray: [Int] = []
        var hashMap: [Int: Int] = [:]
        
        for i in sortedArrayy {
            if let value = hashMap[i] {
                hashMap[i] = value + 1
            } else {
                hashMap[i] = 1
            }
        }
        
        let tt = hashMap.sorted { lhs, rhs in
            lhs.value > rhs.value
        }
        
        for i in tt[0..<k] {
            resultArray.append(i.key)
        }
        return resultArray
    }
}

let sol = Solution()
print(sol.topKFrequent([-1,-1,2,4,1,3,2,4,5,7,8,8,8,8,8,7,6,3,2,4,5,6,6,4,4,3,1,1,1,1,1,1], 8))
