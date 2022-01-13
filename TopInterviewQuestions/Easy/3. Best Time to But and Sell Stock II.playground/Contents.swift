/*
 You are given an integer array prices where prices[i] is the price of a given stock on the ith day.

 On each day, you may decide to buy and/or sell the stock. You can only hold at most one share of the stock at any time. However, you can buy it then immediately sell it on the same day.

 Find and return the maximum profit you can achieve.

  

 Example 1:

 Input: prices = [7,1,5,3,6,4]
 Output: 7
 Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
 Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
 Total profit is 4 + 3 = 7.
 Example 2:

 Input: prices = [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
 Total profit is 4.
 Example 3:

 Input: prices = [7,6,4,3,1]
 Output: 0
 Explanation: There is no way to make a positive profit, so we never buy the stock to achieve the maximum profit of 0.
  

 Constraints:

 1 <= prices.length <= 3 * 104
 0 <= prices[i] <= 104
 */


class Solution {
    
//    func
    func maxProfit(_ prices: [Int]) -> Int {
        //1. 0번부터 n번까지 돌면서 산날 이후로 비싸진 적이 없다면 0을 리턴하라 (쏘팅 후 reverse)
        //2. sorting이 되어있다면 첫날사서 마지막날 파는게 답.. (쏘팅 후 원본과 비교)
        //3. 그게 아니면.. 모든 경우의 수를 비교해봐야하는데.. 일단 1번
        //시간없다.. 이건 내일 첨부터 다시 생각해봐야지 ㅠㅠ
        
        var hashmap : [Int:Int] = [:]
        for (i,v) in prices.enumerated() {
            hashmap[v] = i
        }
        
        let sortedPrices = prices.sorted{ $0 < $1 }
        
        if sortedPrices == prices {
            return prices.last! - prices.first!
        }else if sortedPrices.reversed() == prices {
            return 0
        } else {
            
        }
        return 0
    }
}

let sol = Solution()
sol.maxProfit([7,6,4,3,1])
