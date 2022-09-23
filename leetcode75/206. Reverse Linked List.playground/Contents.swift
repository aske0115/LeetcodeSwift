/**
 206. Reverse Linked List
 Easy

 14683

 249

 Add to List

 Share
 Given the head of a singly linked list, reverse the list, and return the reversed list.

  

 Example 1:


 Input: head = [1,2,3,4,5]
 Output: [5,4,3,2,1]
 Example 2:


 Input: head = [1,2]
 Output: [2,1]
 Example 3:

 Input: head = []
 Output: []
  

 Constraints:

 The number of nodes in the list is the range [0, 5000].
 -5000 <= Node.val <= 5000
  

 Follow up: A linked list can be reversed either iteratively or recursively. Could you implement both?
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

var list = ListNode(1, ListNode(2, ListNode(3)))

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }

        var tail: ListNode?
        var root: ListNode? = head
        var resultNode: ListNode?
        
        while root != nil {
            if let val = root?.val {
                let tempTail = tail
                tail = ListNode(val, tempTail)
                resultNode = tail
                root = root?.next
            }
        }
        
        return resultNode
    }
}


let sol = Solution()
dump(sol.reverseList(list))
