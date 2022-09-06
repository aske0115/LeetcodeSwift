/**
 814. Binary Tree Pruning
 Medium

 2641

 75

 Add to List

 Share
 Given the root of a binary tree, return the same tree where every subtree (of the given tree) not containing a 1 has been removed.

 A subtree of a node node is node plus every node that is a descendant of node.

  

 Example 1:


 Input: root = [1,null,0,0,1]
 Output: [1,null,0,null,1]
 Explanation:
 Only the red nodes satisfy the property "every subtree not containing a 1".
 The diagram on the right represents the answer.
 Example 2:


 Input: root = [1,0,1,0,0,0,1]
 Output: [1,null,1,null,1]
 Example 3:


 Input: root = [1,1,0,1,1,0,1,0]
 Output: [1,1,0,1,1,null,1]
  

 Constraints:

 The number of nodes in the tree is in the range [1, 200].
 Node.val is either 0 or 1.
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
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        
        //TreeNode가 없을 경우 nil 리턴
        guard let root = root else { return nil }
        
       
        //1을 포함하고 있는지 판단하는 재귀함수
        func containsOne(_ node: TreeNode?) -> Bool {
            
            //node가 없을 경우, false를 리턴
            guard let node = node else{ return false }
            
            // left child에 1이 있는지 확인.
            var leftContains = containsOne(node.left)
            
            
            // right child에 1이 있는지 확인.
            var rightContains = containsOne(node.right)
            
            
            //재귀를 마치고 왼쪽을 다 돌았는데 1이 없을 경우, node.left의 연결을 끊음.
            if !leftContains {
                node.left = nil
            }
            
            // 재귀를 마치고 오른쪽을 다 돌았는데 1이 없을 경우, node.right의 연결을 끊음.
            if !rightContains {
                node.right = nil
            }
            
            //노드의 값이 1이거나, 왼쪽에 1이 있거나, 오른쪽이 1이 있으면 tree
            return node.val != 0 || leftContains || rightContains
        }
        
        return containsOne(root) ? root : nil
    }
}
