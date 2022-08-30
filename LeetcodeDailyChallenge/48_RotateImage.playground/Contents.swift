/**
 48. Rotate Image
 Medium

 11237

 550

 Add to List

 Share
 You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).

 You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

  

 Example 1:


 Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [[7,4,1],[8,5,2],[9,6,3]]
 Example 2:


 Input: matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
 Output: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
  

 Constraints:

 n == matrix.length == matrix[i].length
 1 <= n <= 20
 -1000 <= matrix[i][j] <= 1000
 */

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        var n = matrix.count
        for i in 0..<(n + 1) / 2 {
            for j in 0..<(n / 2) {
                var temp = matrix[n - 1 - j][i]
                print("temp = \(temp)")
                matrix[n - 1 - j][i] = matrix[n - 1 - i][n - j - 1]
                print("swap \((n - 1 - j,i)) -> \((n - 1 - i,n - j - 1))")
                matrix[n - 1 - i][n - j - 1] = matrix[j][n - 1 - i]
                print("swap \((n - 1 - j,n - j - 1)) -> \((j,n - 1 - i))")
                matrix[j][n - 1 - i] = matrix[i][j]
                print("swap \((j,n - 1 - i)) -> \((i,j))")
                matrix[i][j] = temp
                print("change \((i,j)) -> \(temp)")
            }
        }
    }
}

let sol = Solution()
var num = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
print(sol.rotate(&num))
print(num)
