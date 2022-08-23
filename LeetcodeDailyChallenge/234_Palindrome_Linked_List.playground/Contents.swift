/**
 234. Palindrome Linked List
 Easy

 10850

 630

 Add to List

 Share
 Given the head of a singly linked list, return true if it is a palindrome.

  

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
        var localHead = head
        var array: [Int] = []
        while localHead != nil {
            
            array.append(localHead!.val)
            localHead = localHead?.next
        }

        return Array(array.prefix(array.count / 2)) == array.suffix(array.count / 2).reversed()
    }
}


let node = ListNode(1)
node.next = ListNode(2)
node.next?.next = ListNode(3)
//node.next?.next?.next = ListNode(1)

let sol = Solution()
print(sol.isPalindrome(node))
