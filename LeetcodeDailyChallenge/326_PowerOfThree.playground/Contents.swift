import Darwin
class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        for i in 0... {
            let pow = Int(pow(3.0 ,Double(i)))
            if pow == n {
                return true
            } else if pow > n {
                return false
            }
        }
        return false
    }
}

let sol = Solution()
print(sol.isPowerOfThree(9))
