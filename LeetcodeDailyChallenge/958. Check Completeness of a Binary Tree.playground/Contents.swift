/**
 958. Check Completeness of a Binary Tree
 Medium
 3.2K
 41
 Companies
 Given the root of a binary tree, determine if it is a complete binary tree.
 
 In a complete binary tree, every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.
 
 
 
 Example 1:
 
 
 Input: root = [1,2,3,4,5,6]
 Output: true
 Explanation: Every level before the last is full (ie. levels with node-values {1} and {2, 3}), and all nodes in the last level ({4, 5, 6}) are as far left as possible.
 Example 2:
 
 
 Input: root = [1,2,3,4,5,null,7]
 Output: false
 Explanation: The node with value 7 isn't as far left as possible.
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [1, 100].
 1 <= Node.val <= 1000
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


var example1 = TreeNode(1, TreeNode(2), TreeNode(3))
example1.left?.left = TreeNode(4)
example1.left?.right = TreeNode(5)
example1.right?.left = TreeNode(6)


var example2 = TreeNode(1, TreeNode(2), TreeNode(3))
example2.left?.left = TreeNode(4)
example2.left?.right = TreeNode(5)
example2.right?.right = TreeNode(7)

class Solution {
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        var q = [root]
        while let n = q.removeFirst() { q += [n.left, n.right] }
        return q.allSatisfy { $0 == nil }
    }
}


print(Solution().isCompleteTree(example1))
