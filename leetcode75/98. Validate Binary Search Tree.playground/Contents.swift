/**
 98. Validate Binary Search Tree
 Medium

 12623

 1016

 Add to List

 Share
 Given the root of a binary tree, determine if it is a valid binary search tree (BST).

 A valid BST is defined as follows:

 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
  

 Example 1:


 Input: root = [2,1,3]
 Output: true
 Example 2:


 Input: root = [5,1,4,null,null,3,6]
 Output: false
 Explanation: The root node's value is 5 but its right child's value is 4.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 -231 <= Node.val <= 231 - 1
 Accepted
 1,681,749
 Submissions
 5,316,981
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
    func isValidBST(_ root: TreeNode?) -> Bool {
        var result: [Int] = []
        func inorder(_ root: TreeNode?) {
            if root == nil {
                return
            }
            inorder(root?.left)
            result.append(root!.val)
            inorder(root?.right)
        }
        inorder(root)
        
        return Set(result).count == result.count && result == result.sorted()
    }
}

