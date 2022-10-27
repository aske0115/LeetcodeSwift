/**
 701. Insert into a Binary Search Tree
 Medium

 4138

 152

 Add to List

 Share
 You are given the root node of a binary search tree (BST) and a value to insert into the tree. Return the root node of the BST after the insertion. It is guaranteed that the new value does not exist in the original BST.

 Notice that there may exist multiple valid ways for the insertion, as long as the tree remains a BST after insertion. You can return any of them.

  

 Example 1:


 Input: root = [4,2,7,1,3], val = 5
 Output: [4,2,7,1,3,5]
 Explanation: Another accepted tree is:

 Example 2:

 Input: root = [40,20,60,10,30,50,70], val = 25
 Output: [40,20,60,10,30,50,70,null,null,25]
 Example 3:

 Input: root = [4,2,7,1,3,null,null,null,null,null,null], val = 5
 Output: [4,2,7,1,3,5]
  

 Constraints:

 The number of nodes in the tree will be in the range [0, 104].
 -108 <= Node.val <= 108
 All the values Node.val are unique.
 -108 <= val <= 108
 It's guaranteed that val does not exist in the original BST.
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
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        var head: TreeNode? = root
        var currentNode: TreeNode? = head
        while true {
            if head == nil {
                head = TreeNode(val)
                break
            }
            
            if currentNode!.val > val {
                if currentNode?.left != nil {
                    currentNode = currentNode?.left
                } else {
                    currentNode?.left = TreeNode(val)
                    break
                }
            } else {
                if currentNode?.right != nil {
                    currentNode = currentNode?.right
                } else{
                    currentNode?.right = TreeNode(val)
                    break
                }
            }
        }
        return head
    }
}
