/**
 566. Reshape the Matrix
 Easy

 2792

 312

 Add to List

 Share
 In MATLAB, there is a handy function called reshape which can reshape an m x n matrix into a new one with a different size r x c keeping its original data.

 You are given an m x n matrix mat and two integers r and c representing the number of rows and the number of columns of the wanted reshaped matrix.

 The reshaped matrix should be filled with all the elements of the original matrix in the same row-traversing order as they were.

 If the reshape operation with given parameters is possible and legal, output the new reshaped matrix; Otherwise, output the original matrix.

  

 Example 1:


 Input: mat = [[1,2],[3,4]], r = 1, c = 4
 Output: [[1,2,3,4]]
 Example 2:


 Input: mat = [[1,2],[3,4]], r = 2, c = 4
 Output: [[1,2],[3,4]]
  

 Constraints:

 m == mat.length
 n == mat[i].length
 1 <= m, n <= 100
 -1000 <= mat[i][j] <= 1000
 1 <= r, c <= 300
 */

class Solution {
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        var flatArray = mat.flatMap { $0 }
        if flatArray.count != r * c {
            return mat
        }
        
        var resultArray:[[Int]] = []
        var lastCount = 0
        for _ in 0..<r {
            resultArray.append(Array(flatArray[lastCount..<lastCount + c]))
            lastCount += c
        }
        return resultArray
    }
}

print(Solution().matrixReshape([[1,2],[3,4]], 1, 4))
print(Solution().matrixReshape([[1,2],[3,4]], 2, 4))
