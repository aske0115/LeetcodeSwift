/**
 Reverse Integer
 
 Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

 Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

  

 Example 1:

 Input: x = 123
 Output: 321
 Example 2:

 Input: x = -123
 Output: -321
 Example 3:

 Input: x = 120
 Output: 21
  

 Constraints:

 -231 <= x <= 231 - 1
 */

class Solution {
    func reverse(_ x: Int) -> Int {
        var num = abs(x)
        var st = String(num).reversed().map {  String ($0) }
        if let index = st.firstIndex { $0 != "0"} {
            st = Array(st[index..<st.count])
        }
        var resultValue = Int(st.joined(separator: ""))! * (x > 0 ? 1 : -1)
        return resultValue < Int32.min || resultValue > Int32.max ? 0 : resultValue
    }
}


let sol = Solution()
print(sol.reverse(1534236469))
