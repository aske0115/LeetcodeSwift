/**
 83. Remove Duplicates from Sorted List
 Easy

 6081

 212

 Add to List

 Share
 Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.

  

 Example 1:


 Input: head = [1,1,2]
 Output: [1,2]
 Example 2:


 Input: head = [1,1,2,3,3]
 Output: [1,2,3]
  

 Constraints:

 The number of nodes in the list is in the range [0, 300].
 -100 <= Node.val <= 100
 The list is guaranteed to be sorted in ascending order.
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        
        var root: ListNode? = head
        
        while root != nil {
            if root!.val == root!.next?.val {
                root?.next = root?.next?.next
            } else {
                root = root?.next
            }
        }
    
        return head
    }
}
