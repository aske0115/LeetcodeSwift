/**
 746. Min Cost Climbing Stairs
 Easy

 7960

 1267

 Add to List

 Share
 You are given an integer array cost where cost[i] is the cost of ith step on a staircase. Once you pay the cost, you can either climb one or two steps.

 You can either start from the step with index 0, or the step with index 1.

 Return the minimum cost to reach the top of the floor.

  

 Example 1:

 Input: cost = [10,15,20]
 Output: 15
 Explanation: You will start at index 1.
 - Pay 15 and climb two steps to reach the top.
 The total cost is 15.
 Example 2:

 Input: cost = [1,100,1,1,1,100,1,1,100,1]
 Output: 6
 Explanation: You will start at index 0.
 - Pay 1 and climb two steps to reach index 2.
 - Pay 1 and climb two steps to reach index 4.
 - Pay 1 and climb two steps to reach index 6.
 - Pay 1 and climb one step to reach index 7.
 - Pay 1 and climb two steps to reach index 9.
 - Pay 1 and climb one step to reach the top.
 The total cost is 6.
  

 Constraints:

 2 <= cost.length <= 1000
 0 <= cost[i] <= 999
 */

class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        guard !cost.isEmpty else{return 0}
        guard cost.count > 2 else {
            return cost.min() ?? 0
        }
     
        var first = 0
        var second = 0
        
        for i in 2..<cost.count{
            let temp = min(first + cost[i-2] , second + cost[i-1])
            first = second
            second = temp
        }
        let count = cost.count
        let result = min(first + cost[count-2] , second + cost[count-1])
        return result
    }
}

