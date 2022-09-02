/**
 637. Average of Levels in Binary Tree
 Easy

 3319

 253

 Add to List

 Share
 Given the root of a binary tree, return the average value of the nodes on each level in the form of an array. Answers within 10-5 of the actual answer will be accepted.
  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: [3.00000,14.50000,11.00000]
 Explanation: The average value of nodes on level 0 is 3, on level 1 is 14.5, and on level 2 is 11.
 Hence return [3, 14.5, 11].
 Example 2:


 Input: root = [3,9,20,15,7]
 Output: [3.00000,14.50000,11.00000]
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 -231 <= Node.val <= 231 - 1
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
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        /*
         BFS 에 필요한 것들.
         1. Node들을 담을 Queue
         2. Node들의 left,right 즉 child들을 담을 배열을  loop마다 새로 생성
         */
        guard let root = root else { return [] }
        
        //bfs 이므로 Node를 담을 queue를 생성
        var queue: [TreeNode] = []
        var result: [Double] = []
        
        //queue에 root Node를 넣음.
        queue.append(root)
        
        
        //queue가 빌때까지 반복
        while !queue.isEmpty {
            
            //현재 queue(node들)의 자식들을 담을 배열 생성
            var child: [TreeNode] = []
            
            var count = queue.count
            var sum = 0
            
            
            //queue에 들어있는 tree를 비교하고, left,right child가 있는 경우, child 배열에 저장..
            //child배열은 이후 queue에 넣음.
           
            
            /*
             반복문이 실행되면 하는 일들.
             1. 최초 rootNode가 queue에 들어있음.
             2. for문을 돌면 rootNode 하나가 나옴.
             3. rootNode에 left가 있다면 left child를 child 배열에 추가
             4. rootNode에 right가 있다면 right child를 child 배열에 추가.
             5. queue에 child값을 넣고 다시 while을 돌림.
             <<결국 level 0의 노드를 돌고, level 0의 left와 right가 있는지 확인하여 다음 level의 left ,right를 모두 child 배열에 추가한 후 while문을 돌게되고 while문 내부 for문을 통해서 level1의 모든 tree를 돔과 동시에 각 트리의 child를 모두 append 해서 그 다음 level의 node를 돌게 됨>>
             */
            for tree in queue {
                sum += tree.val
                
                if let left = tree.left {
                    child.append(left)
                }
                
                if let right = tree.right {
                    child.append(right)
                }
            }
            
            
            result.append(Double(sum) / Double(count))
            queue = child
        }
        return result
    }
}


