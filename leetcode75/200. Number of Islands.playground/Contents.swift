/**
 200. Number of Islands
 Medium

 17169

 395

 Add to List

 Share
 Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

 An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

  

 Example 1:

 Input: grid = [
   ["1","1","1","1","0"],
   ["1","1","0","1","0"],
   ["1","1","0","0","0"],
   ["0","0","0","0","0"]
 ]
 Output: 1
 Example 2:

 Input: grid = [
   ["1","1","0","0","0"],
   ["1","1","0","0","0"],
   ["0","0","1","0","0"],
   ["0","0","0","1","1"]
 ]
 Output: 3
  

 Constraints:

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 300
 grid[i][j] is '0' or '1'.
 */


class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        
        var visited: [(Int, Int)] = []
        func dfs(_ grid:[[Character]], _ row: Int, _ col: Int) -> Bool {
            if row < 0 ||  col < 0 {
                return false
            }
            
            if row >= grid.count || col >= grid[0].count {
                return false
            }
            
            if grid[row][col] == "0" {
                return false
            }
            
            var temp = (row, col)
            if !visited.contains { $0.0 == row && $0.1 == col } {
                visited.append((row,col))
                dfs(grid, row - 1, col)
                dfs(grid, row + 1, col)
                dfs(grid, row, col - 1)
                dfs(grid, row, col + 1)
                return true
            }
            
            return false
        }
        
        var result = 0
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if dfs(grid, i,j) {
                    result += 1
                }
            }
        }
        
        return result
    }
}
