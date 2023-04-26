/**
 258. Add Digits
 Easy
 3.6K
 1.8K
 Companies
 Given an integer num, repeatedly add all its digits until the result has only one digit, and return it.

  

 Example 1:

 Input: num = 38
 Output: 2
 Explanation: The process is
 38 --> 3 + 8 --> 11
 11 --> 1 + 1 --> 2
 Since 2 has only one digit, return it.
 Example 2:

 Input: num = 0
 Output: 0
  

 Constraints:

 0 <= num <= 231 - 1
  

 Follow up: Could you do it without any loop/recursion in O(1) runtime?
 */

class Solution {
    func addDigits(_ num: Int) -> Int {
        guard num != 0 else { return 0 }
        var sum = calculateSum(makeIntegerArray(num))
        while sum / 10 != 0 {
            sum = calculateSum(makeIntegerArray(sum))
        }
        return sum
    }

    private func makeIntegerArray(_ num: Int) -> [Int] {
        String(num).compactMap{Int(String($0))}
    }

    private func calculateSum(_ nums:[Int]) -> Int {
        nums.reduce(0, +)
    }
}
