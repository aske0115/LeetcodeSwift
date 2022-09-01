/**
 1448. Count Good Nodes in Binary Tree
 Medium

 2938

 91

 Add to List

 Share
 Given a binary tree root, a node X in the tree is named good if in the path from root to X there are no nodes with a value greater than X.

 Return the number of good nodes in the binary tree.

  

 Example 1:



 Input: root = [3,1,4,3,null,1,5]
 Output: 4
 Explanation: Nodes in blue are good.
 Root Node (3) is always a good node.
 Node 4 -> (3,4) is the maximum value in the path starting from the root.
 Node 5 -> (3,4,5) is the maximum value in the path
 Node 3 -> (3,1,3) is the maximum value in the path.
 Example 2:



 Input: root = [3,3,null,4,2]
 Output: 3
 Explanation: Node 2 -> (3, 3, 2) is not good, because "3" is higher than it.
 Example 3:

 Input: root = [1]
 Output: 1
 Explanation: Root is considered as good.
  

 Constraints:

 The number of nodes in the binary tree is in the range [1, 10^5].
 Each node's value is between [-10^4, 10^4].
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
//[2,null,4,10,8,null,null,4]


var node = TreeNode(2)
node.right = TreeNode(4)
node.right?.left = TreeNode(10)
node.right?.right = TreeNode(8)
node.right?.right?.left = TreeNode(4)

//var node = TreeNode(3)
//node.left = TreeNode(1)
//node.left?.left = TreeNode(3)
//node.right = TreeNode(4)
//node.right?.left = TreeNode(1)
//node.right?.right = TreeNode(5)

class Solution {
    func goodNodes(_ root: TreeNode?) -> Int {
        if let root = root {
            return searchTree(root, root.val)
        }
        return 0
    }
    
    func searchTree(_ tree: TreeNode?, _ greaterCount: Int) -> Int {
        guard let tree = tree else {
            return 0
        }
        var count = 0
        print("tree : \(tree.val)")
        print("tree.left \(tree.left?.val)")
        print("tree.right \(tree.right?.val)")
        if tree.val >= greaterCount {
            print("count")
            count += 1
        }
        
        var callCount = greaterCount + count
        
        var maxValue = max(tree.val, greaterCount)
        return count + searchTree(tree.left, maxValue) + searchTree(tree.right, maxValue)
    }
}

let sol = Solution()
print(sol.goodNodes(node))
