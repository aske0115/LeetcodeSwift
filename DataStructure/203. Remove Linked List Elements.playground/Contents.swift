/**
 203. Remove Linked List Elements
 Easy

 6202

 187

 Add to List

 Share
 Given the head of a linked list and an integer val, remove all the nodes of the linked list that has Node.val == val, and return the new head.

  

 Example 1:


 Input: head = [1,2,6,3,4,5,6], val = 6
 Output: [1,2,3,4,5]
 Example 2:

 Input: head = [], val = 1
 Output: []
 Example 3:

 Input: head = [7,7,7,7], val = 7
 Output: []
  

 Constraints:

 The number of nodes in the list is in the range [0, 104].
 1 <= Node.val <= 50
 0 <= val <= 50
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution1 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var root: ListNode? = head
        var resultNode: ListNode? = root
 
        while root != nil {
            if resultNode?.val == val {
                resultNode = resultNode?.next
            } else if root?.next?.val == val {
                root?.next = root?.next?.next
            } else {
                root = root?.next
            }
        }
        return resultNode
    }
}

class Solution2 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var root: ListNode? = head
        var values: [Int] = []
        while root != nil {
            if root!.val != val {
                values.append(root!.val)
            }
            root = root?.next
        }

        if values.count == 0 {
            return nil
        }

        var node: ListNode? = ListNode(values.removeFirst())
        var resultNode: ListNode? = node

        for i in values {
            if node == nil {
                node = ListNode(i)
            } else {
                node?.next = ListNode(i)
            }
            node = node?.next
        }
        return resultNode
    }
}
