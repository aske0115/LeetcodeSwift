/**
 234. Palindrome Linked List
 Easy

 12217

 682

 Add to List

 Share
 Given the head of a singly linked list, return true if it is a palindrome or false otherwise.

  

 Example 1:


 Input: head = [1,2,2,1]
 Output: true
 Example 2:


 Input: head = [1,2]
 Output: false
  

 Constraints:

 The number of nodes in the list is in the range [1, 105].
 0 <= Node.val <= 9
  

 Follow up: Could you do it in O(n) time and O(1) space?
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard let head = head else { return false }
        var root: ListNode? = head
        var nodeValue: [Int] = []
        while root != nil {
            nodeValue.append(root!.val)
            root = root?.next
        }
        
        while nodeValue.count > 1 {
            let first = nodeValue.removeFirst()
            let last = nodeValue.removeLast()
            if first != last {
                return false
            }
        }
        return true
    }
}
