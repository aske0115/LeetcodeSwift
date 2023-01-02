/**
 739. Daily Temperatures
 Medium
 9.5K
 218
 Companies
 Given an array of integers temperatures represents the daily temperatures, return an array answer such that answer[i] is the number of days you have to wait after the ith day to get a warmer temperature. If there is no future day for which this is possible, keep answer[i] == 0 instead.

  

 Example 1:

 Input: temperatures = [73,74,75,71,69,72,76,73]
 Output: [1,1,4,2,1,1,0,0]
 Example 2:

 Input: temperatures = [30,40,50,60]
 Output: [1,1,1,0]
 Example 3:

 Input: temperatures = [30,60,90]
 Output: [1,1,0]
  

 Constraints:

 1 <= temperatures.length <= 105
 30 <= temperatures[i] <= 100
 */

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result: [Int] = []
        var before:(Int, Int) = (-1,-1)

        for (i,v) in temperatures.enumerated() {
            if v == before.0, before.1 == (i..<temperatures.count).count {
                result.append(before.1 - 1)
                before = (v, before.1 - 1)
                continue
            }
            
            if let index = temperatures[i..<temperatures.count].firstIndex( where: { $0 > v }) {
                result.append(index - i)
                before = (v, index - i)
            } else {
                result.append(0)
            }
        }
        return result
    }
}
