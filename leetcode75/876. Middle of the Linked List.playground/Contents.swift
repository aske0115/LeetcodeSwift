/**
 876. Middle of the Linked List
 Easy

 7046

 188

 Add to List

 Share
 Given the head of a singly linked list, return the middle node of the linked list.

 If there are two middle nodes, return the second middle node.

  

 Example 1:


 Input: head = [1,2,3,4,5]
 Output: [3,4,5]
 Explanation: The middle node of the list is node 3.
 Example 2:


 Input: head = [1,2,3,4,5,6]
 Output: [4,5,6]
 Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.
  

 Constraints:

 The number of nodes in the list is in the range [1, 100].
 1 <= Node.val <= 100
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var count = 0
        var root:ListNode? =  head
        
        while root != nil {
            count += 1
            root = root?.next
        }
        
        var index = 0
        
        root = head
        
        while root != nil {
            if index == count / 2 {
                return root
            }
            index += 1
            root = root?.next
        }
        
        return root
    }
}
