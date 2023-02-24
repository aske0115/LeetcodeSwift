/**
 2160. Minimum Sum of Four Digit Number After Splitting Digits
 Easy
 971
 95
 Companies
 You are given a positive integer num consisting of exactly four digits. Split num into two new integers new1 and new2 by using the digits found in num. Leading zeros are allowed in new1 and new2, and all the digits found in num must be used.

 For example, given num = 2932, you have the following digits: two 2's, one 9 and one 3. Some of the possible pairs [new1, new2] are [22, 93], [23, 92], [223, 9] and [2, 329].
 Return the minimum possible sum of new1 and new2.

  

 Example 1:

 Input: num = 2932
 Output: 52
 Explanation: Some possible pairs [new1, new2] are [29, 23], [223, 9], etc.
 The minimum sum can be obtained by the pair [29, 23]: 29 + 23 = 52.
 Example 2:

 Input: num = 4009
 Output: 13
 Explanation: Some possible pairs [new1, new2] are [0, 49], [490, 0], etc.
 The minimum sum can be obtained by the pair [4, 9]: 4 + 9 = 13.
  

 Constraints:

 1000 <= num <= 9999
 */


class Solution {
    func minimumSum(_ num: Int) -> Int {
        var arrayInt = String(num).compactMap { $0.wholeNumberValue }.filter { $0 != 0 }.sorted()


        if arrayInt.count < 3 {
            return arrayInt.first! + (arrayInt.count == 1 ? 0 : arrayInt.last!)
        }

        if arrayInt.count == 3 {
            return (arrayInt.first! * 10) + arrayInt[1] + arrayInt[2]
        }

        return (arrayInt[0] * 10 + arrayInt[2]) + (arrayInt[1] * 10 + arrayInt[3])
    }
}
