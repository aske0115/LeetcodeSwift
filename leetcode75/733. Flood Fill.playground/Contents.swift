/**
 733. Flood Fill
 Easy

 5545

 538

 Add to List

 Share
 An image is represented by an m x n integer grid image where image[i][j] represents the pixel value of the image.

 You are also given three integers sr, sc, and color. You should perform a flood fill on the image starting from the pixel image[sr][sc].

 To perform a flood fill, consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color), and so on. Replace the color of all of the aforementioned pixels with color.

 Return the modified image after performing the flood fill.

  

 Example 1:


 Input: image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, color = 2
 Output: [[2,2,2],[2,2,0],[2,0,1]]
 Explanation: From the center of the image with position (sr, sc) = (1, 1) (i.e., the red pixel), all pixels connected by a path of the same color as the starting pixel (i.e., the blue pixels) are colored with the new color.
 Note the bottom corner is not colored 2, because it is not 4-directionally connected to the starting pixel.
 Example 2:

 Input: image = [[0,0,0],[0,0,0]], sr = 0, sc = 0, color = 0
 Output: [[0,0,0],[0,0,0]]
 Explanation: The starting pixel is already colored 0, so no changes are made to the image.
  

 Constraints:

 m == image.length
 n == image[i].length
 1 <= m, n <= 50
 0 <= image[i][j], color < 216
 0 <= sr < m
 0 <= sc < n
 */

class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        
        func addNeedChange(_ sr: Int, _ sc: Int) {
            if sr > 0 {
                 if image[max(0,sr - 1)][sc] == imageColor {
                    needChange.append((max(0,sr - 1), sc))
                 }
            }
            
            if sr < image.count - 1 {
                if image[min(image.count,sr + 1)][sc] == imageColor {
                  needChange.append((min(image.count,sr + 1), sc))
                }
            }
           
            if sc > 0 {
                 if  image[sr][max(0, sc - 1)] == imageColor {
                    needChange.append((sr, max(0, sc - 1)))
                }
            }
            
            if sc < image[sr].count - 1 {
                
                if image[sr][min(image[sr].count, sc + 1)] == imageColor {
                    needChange.append((sr, min(image[sr].count, sc + 1)))
                }
            }
        }
        
        var imageColor = image[sr][sc]
        if color == imageColor {
            return image
        }
        
        var returnValue = image
        var visited: [(Int, Int)] = []
        returnValue[sr][sc] = color
        visited.append((sr,sc))
        
        var needChange: [(Int, Int)] = []
        addNeedChange(sr,sc)
 
        while !needChange.isEmpty {
            let need = needChange.removeLast()
            returnValue[need.0][need.1] = color
            if visited.contains { $0.0 == need.0 && $0.1 == need.1 } {
                continue
            }
            visited.append((need.0, need.1))
            addNeedChange(need.0, need.1)
        }
        
        return returnValue
    }
}

let sol = Solution()
print(sol.floodFill([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2))
