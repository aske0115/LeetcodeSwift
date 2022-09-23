/**
 21. Merge Two Sorted Lists
 Easy

 14977

 1317

 Add to List

 Share
 You are given the heads of two sorted linked lists list1 and list2.

 Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.

 Return the head of the merged linked list.

  

 Example 1:


 Input: list1 = [1,2,4], list2 = [1,3,4]
 Output: [1,1,2,3,4,4]
 Example 2:

 Input: list1 = [], list2 = []
 Output: []
 Example 3:

 Input: list1 = [], list2 = [0]
 Output: [0]
  

 Constraints:

 The number of nodes in both lists is in the range [0, 50].
 -100 <= Node.val <= 100
 Both list1 and list2 are sorted in non-decreasing order.
 */



public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 = list1 else {
            return list2
        }
        
        guard let list2 = list2 else {
            return list1
        }
        
        var nodeValueArray: [Int] = []
        
        var headList1: ListNode? = list1
        var headList2: ListNode? = list2
        
        while headList1 != nil {
            nodeValueArray.append(headList1!.val)
            headList1 = headList1?.next
        }
        
        while headList2 != nil {
            nodeValueArray.append(headList2!.val)
            headList2 = headList2?.next
        }
        
        var sortedArray = nodeValueArray.sorted()
        var mergedList: ListNode? = ListNode(sortedArray.removeFirst())
        var head = mergedList
        
        while sortedArray.count != 0 {
            let value = sortedArray.removeFirst()
            mergedList?.next = ListNode(value)
            mergedList = mergedList?.next
        }
        
        return head
    }
}


