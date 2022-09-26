/**
 102. Binary Tree Level Order Traversal
 Medium

 10920

 207

 Add to List

 Share
 Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: [[3],[9,20],[15,7]]
 Example 2:

 Input: root = [1]
 Output: [[1]]
 Example 3:

 Input: root = []
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [0, 2000].
 -1000 <= Node.val <= 1000
 Accepted
 1,522,315
 Submissions
 2,416,308
 */



public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
//[1,2,3,4,null,null,5]
let node = TreeNode(0)
node.left = TreeNode(2)
node.right = TreeNode(4)
node.left?.left = TreeNode(1)
node.left?.left?.left = TreeNode(5)
node.left?.left?.right = TreeNode(1)
node.right?.left = TreeNode(3)
node.right?.right = TreeNode(-1)
node.right?.left?.right = TreeNode(6)
node.right?.right?.right = TreeNode(8)

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var head: TreeNode? = root
        var result: [[Int]] = []
        var queue: [[TreeNode]] = []
        queue.append([root])
        result.append([root.val])
        
        while queue.count != 0 {
            var node = queue.removeFirst()
            var values: [Int] = []
            var temp: [TreeNode] = []
            while node.count != 0 {
                var value = node.removeFirst()
                if let left = value.left {
                    temp.append(left)
                    values += [left.val]
                }
                
                if let right = value.right {
                    temp.append(right)
                    values += [right.val]
                }
            }
            if temp.count > 0 {
                queue.append(temp)
            }
            
            if values.count > 0 {
                result.append(values)
            }

        }
        return result
    }
}


let sol = Solution()
print(sol.levelOrder(node))
