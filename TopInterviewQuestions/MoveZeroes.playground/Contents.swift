class Solution {
    func moveZeroes(_ nums: inout [Int]) {

        var zeroesCount = nums.filter { $0 == 0}.count
        for i in 0..<zeroesCount {
            if let firstindex = nums.firstIndex(of: 0) {
                nums.remove(at: firstindex)
                nums.append(0)

            } else {
                break
            }
        }
    }
}


let sol = Solution()
var nums = [1,2,3,4,5,6,7,8,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
sol.moveZeroes(&nums)
print(nums)
