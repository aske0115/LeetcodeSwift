/**
 118. Pascal's Triangle
 Easy

 8181

 271

 Add to List

 Share
 Given an integer numRows, return the first numRows of Pascal's triangle.

 In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:


  

 Example 1:

 Input: numRows = 5
 Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
 Example 2:

 Input: numRows = 1
 Output: [[1]]
  

 Constraints:

 1 <= numRows <= 30

 */


class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var resultArray: [[Int]] = [[1]]
        for i in 1..<numRows {
            let value = resultArray[i - 1]
            var array = [1,1]
            for j in 0..<value.count - 1 {
                array.insert(value[j] + value[j + 1], at: j + 1)
            }
            resultArray.append(array)
        }
        return resultArray
    }
}

print(Solution().generate(5))
