/**
 142. Linked List Cycle II
 Medium
 
 8970
 
 619
 
 Add to List
 
 Share
 Given the head of a linked list, return the node where the cycle begins. If there is no cycle, return null.
 
 There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to (0-indexed). It is -1 if there is no cycle. Note that pos is not passed as a parameter.
 
 Do not modify the linked list.
 
 
 
 Example 1:
 
 
 Input: head = [3,2,0,-4], pos = 1
 Output: tail connects to node index 1
 Explanation: There is a cycle in the linked list, where tail connects to the second node.
 Example 2:
 
 
 Input: head = [1,2], pos = 0
 Output: tail connects to node index 0
 Explanation: There is a cycle in the linked list, where tail connects to the first node.
 Example 3:
 
 
 Input: head = [1], pos = -1
 Output: no cycle
 Explanation: There is no cycle in the linked list.
 
 
 Constraints:
 
 The number of the nodes in the list is in the range [0, 104].
 -105 <= Node.val <= 105
 pos is -1 or a valid index in the linked-list.
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
}

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var hashMap: [Int : [(current: Int?, next: Int?)]] = [:]
        var root: ListNode? = head
        while root != nil {
            if let next = root!.next {
                if let val = hashMap[root!.val] {
                    if val.contains { $0.current == root!.next?.val && $0.next == root!.next?.next?.val } {
                        return root
                    }
                    hashMap[root!.val]! += [(current: root!.next?.val, next: root!.next?.next?.val)]
                } else {
                    hashMap[root!.val] = [(current: root!.next?.val, next: root!.next?.next?.val)]
                }
            }
            root = root?.next
        }
        return nil
    }
}
