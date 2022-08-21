/**
 2. Add Two Numbers
 Medium

 20785

 4105

 Add to List

 Share
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

  

 Example 1:


 Input: l1 = [2,4,3], l2 = [5,6,4]
 Output: [7,0,8]
 Explanation: 342 + 465 = 807.
 Example 2:

 Input: l1 = [0], l2 = [0]
 Output: [0]
 Example 3:

 Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 Output: [8,9,9,9,0,0,0,1]
  

 Constraints:

 The number of nodes in each linked list is in the range [1, 100].
 0 <= Node.val <= 9
 It is guaranteed that the list represents a number that does not have leading zeros.
 */


//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


var node1: ListNode?
var rootNode1 = node1
for i in [5] {
    if node1 == nil {
        node1 = ListNode(i)
        rootNode1 = node1
    } else {
        rootNode1?.next = ListNode(i)
        rootNode1 = rootNode1?.next
    }
}


var node2 = ListNode(5)

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        if l1 == nil || l2 == nil {
            return nil
        }
        
        var firstNode: ListNode? = l1
        var secondNode: ListNode? = l2
        
        var firstNum: [Int] = []
        var secondNum: [Int] = []
        
        
        while firstNode != nil {
            firstNum.append(firstNode?.val ?? 0)
            firstNode = firstNode?.next
        }
        
        while secondNode != nil {
            secondNum.append(secondNode?.val ?? 0)
            secondNode = secondNode?.next
        }
        
        var upper: Bool = false
        
        var resultNode:ListNode?
        var rootNode = resultNode
        
        for i in 0..<max(firstNum.count, secondNum.count) {
            let sum = (firstNum.count > i ? firstNum[i] : 0) + (secondNum.count > i ? secondNum[i] : 0) + (upper ? 1 : 0)
            upper = sum > 9
  
            if resultNode == nil {
                resultNode = ListNode(upper ? (sum % 10) : sum)
                rootNode = resultNode
            } else {
                rootNode?.next = ListNode(upper ? (sum % 10) : sum)
                rootNode = rootNode?.next
            }
        }
        
        if upper {
            rootNode?.next = ListNode(1)
        }
        return resultNode
    }
}

let sol = Solution()
dump(sol.addTwoNumbers(node1, node2))
