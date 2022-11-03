/**
 204. Count Primes
 Medium

 5848

 1135

 Add to List

 Share
 Given an integer n, return the number of prime numbers that are strictly less than n.

  

 Example 1:

 Input: n = 10
 Output: 4
 Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
 Example 2:

 Input: n = 0
 Output: 0
 Example 3:

 Input: n = 1
 Output: 0
  

 Constraints:

 0 <= n <= 5 * 106
 */

import Foundation

class Solution {
    func countPrimes(_ n: Int) -> Int {
        guard n > 1 else { return 0 }
        var result: [Int] = Array(2..<n)
        var maxValue = Int(sqrt(Double(n))) < 2 ? n : Int(sqrt(Double(n)))
                           
        
        for i in 2...maxValue {
            if !result.contains(i) {
                continue
            }
            for j in stride(from: i - 1, to : 0, by: -1 ) {
                if i % j == 0 {
                    result.removeAll { $0 != i && $0 % i == 0 }
                    break;
                }
            }
        }
        
        return result.count
    }
}


print(Solution().countPrimes(499979))
