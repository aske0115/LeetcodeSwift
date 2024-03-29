/**
 141. Linked List Cycle
 Easy

 10379

 891

 Add to List

 Share
 Given head, the head of a linked list, determine if the linked list has a cycle in it.

 There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.

 Return true if there is a cycle in the linked list. Otherwise, return false.

  

 Example 1:


 Input: head = [3,2,0,-4], pos = 1
 Output: true
 Explanation: There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).
 Example 2:


 Input: head = [1,2], pos = 0
 Output: true
 Explanation: There is a cycle in the linked list, where the tail connects to the 0th node.
 Example 3:


 Input: head = [1], pos = -1
 Output: false
 Explanation: There is no cycle in the linked list.
  

 Constraints:

 The number of the nodes in the list is in the range [0, 104].
 -105 <= Node.val <= 105
 pos is -1 or a valid index in the linked-list.
  

 Follow up: Can you solve it using O(1) (i.e. constant) memory?
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
    func hasCycle(_ head: ListNode?) -> Bool {
        var root: ListNode? = head
        var visited:[String: (next: Int?, nextNext: Int?)] = [:]
        while root != nil {
            if let value = visited["\(root!.val)"], value.next == root!.next?.val, value.nextNext == root?.next?.next?.val {
                return true
            }
            visited["\(root!.val)"] = (next: root?.next?.val, nextNext: root?.next?.next?.val)
            
            root = root?.next?.next
        }
        return false
    }
}

let listNode = ListNode(3)
listNode.next = ListNode(2)
listNode.next?.next = ListNode(0)
listNode.next?.next?.next = ListNode(4)
listNode.next?.next?.next?.next = listNode.next


print(Solution().hasCycle(listNode))
