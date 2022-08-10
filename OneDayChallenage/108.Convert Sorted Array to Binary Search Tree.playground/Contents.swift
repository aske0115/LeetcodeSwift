

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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        var center = nums.count / 2
        var tree = TreeNode(nums[center])
        
        dump(tree)
        var head: TreeNode? = tree
        
        for i in nums[0..<center].reversed() {
            print(i)
            while head?.left != nil {
                head = head?.left
            }
            
            head?.left = TreeNode(i)
        }
        
        head = tree
        
        for i in nums[center..<nums.count] {
            while head?.right != nil {
                head = head?.right
            }
            head?.right = TreeNode(i)
        }
        
        return tree
    }
}

let sol = Solution()
dump(sol.sortedArrayToBST([-10,-3,0,5,9]))

