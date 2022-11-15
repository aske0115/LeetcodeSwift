/**
 222. Count Complete Tree Nodes
 Medium
 6.1K
 345
 Companies
 Given the root of a complete binary tree, return the number of the nodes in the tree.

 According to Wikipedia, every level, except possibly the last, is completely filled in a complete binary tree, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

 Design an algorithm that runs in less than O(n) time complexity.

  

 Example 1:


 Input: root = [1,2,3,4,5,6]
 Output: 6
 Example 2:

 Input: root = []
 Output: 0
 Example 3:

 Input: root = [1]
 Output: 1
  

 Constraints:

 The number of nodes in the tree is in the range [0, 5 * 104].
 0 <= Node.val <= 5 * 104
 The tree is guaranteed to be complete.

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

class Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        
        var count = 0
        func inorder(_ tree: TreeNode?) {
            if tree == nil {
                return
            }
            inorder(tree?.left)
            count += 1
            inorder(tree?.right)
        }
        inorder(root)
        return count

    }
}
