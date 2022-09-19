/**
 19. Remove Nth Node From End of List
 Medium

 12437

 538

 Add to List

 Share
 Given the head of a linked list, remove the nth node from the end of the list and return its head.

  

 Example 1:


 Input: head = [1,2,3,4,5], n = 2
 Output: [1,2,3,5]
 Example 2:

 Input: head = [1], n = 1
 Output: []
 Example 3:

 Input: head = [1,2], n = 1
 Output: [1]
  

 Constraints:

 The number of nodes in the list is sz.
 1 <= sz <= 30
 0 <= Node.val <= 100
 1 <= n <= sz
  

 Follow up: Could you do this in one pass?
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        if head == nil {
            return head
        }
        
        var root: ListNode? = head
        var count = 0
        while root != nil {
            count += 1
            root = root?.next
        }
        
        root = head
        var removeNodeIndex = count - n
        
        if removeNodeIndex == 0 {
            return root?.next
        }
        
        count = 0
        while root != nil {
            //지울 노드의 앞의 노드일 경우,
            if count + 1 == removeNodeIndex {
                root?.next = root?.next?.next
                break
            }
            count += 1
            root = root?.next
        }
        
        return head
        
    }
}
