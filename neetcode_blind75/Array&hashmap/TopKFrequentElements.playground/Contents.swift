class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        
        var sortedArrayy = nums.sorted()
        var resultArray: [Int] = []
        var hashMap: [Int: Int] = [:]
        
        while sortedArrayy.count > 0 {
            let first = sortedArrayy.first!
            let count = sortedArrayy.count
            sortedArrayy.removeAll { $0 == first}
            hashMap[first] = count - sortedArrayy.count
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
print(sol.topKFrequent([-1,-1], 1))
