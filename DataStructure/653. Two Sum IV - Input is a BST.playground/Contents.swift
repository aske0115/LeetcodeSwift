/**
 653. Two Sum IV - Input is a BST
 Easy

 5302

 230

 Add to List

 Share
 Given the root of a Binary Search Tree and a target number k, return true if there exist two elements in the BST such that their sum is equal to the given target.

  

 Example 1:


 Input: root = [5,3,6,2,4,null,7], k = 9
 Output: true
 Example 2:


 Input: root = [5,3,6,2,4,null,7], k = 28
 Output: false
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 -104 <= Node.val <= 104
 root is guaranteed to be a valid binary search tree.
 -105 <= k <= 105
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
    var visited:[Int] = []
    
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        guard let root = root else { return false }
        var diff = k - root.val
            
        if visited.contains(root.val) {
            return true
        }
        visited.append(diff)

        return findTarget(root.left,k) || findTarget(root.right, k)
    }
}
