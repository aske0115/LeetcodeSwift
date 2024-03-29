/**
 944. Delete Columns to Make Sorted
 Easy
 929
 2.4K
 Companies
 You are given an array of n strings strs, all of the same length.

 The strings can be arranged such that there is one on each line, making a grid. For example, strs = ["abc", "bce", "cae"] can be arranged as:

 abc
 bce
 cae
 You want to delete the columns that are not sorted lexicographically. In the above example (0-indexed), columns 0 ('a', 'b', 'c') and 2 ('c', 'e', 'e') are sorted while column 1 ('b', 'c', 'a') is not, so you would delete column 1.

 Return the number of columns that you will delete.

  

 Example 1:

 Input: strs = ["cba","daf","ghi"]
 Output: 1
 Explanation: The grid looks as follows:
   cba
   daf
   ghi
 Columns 0 and 2 are sorted, but column 1 is not, so you only need to delete 1 column.
 Example 2:

 Input: strs = ["a","b"]
 Output: 0
 Explanation: The grid looks as follows:
   a
   b
 Column 0 is the only column and is sorted, so you will not delete any columns.
 Example 3:

 Input: strs = ["zyx","wvu","tsr"]
 Output: 3
 Explanation: The grid looks as follows:
   zyx
   wvu
   tsr
 All 3 columns are not sorted, so you will delete all 3.
  

 Constraints:

 n == strs.length
 1 <= n <= 100
 1 <= strs[i].length <= 1000
 strs[i] consists of lowercase English letters.
 */

//내가 풀었으나 timeOut
//class Solution {
//    func minDeletionSize(_ strs: [String]) -> Int {
//
//        var index = 0
//        let length = strs.first!.count
//        var deletedCount = 0
//
//        while index < length {
//            var column: [Character] = []
//            for c in strs {
//                let i = c.index(c.startIndex, offsetBy: index)
//                if let last = column.last, last > c[i] {
//                    deletedCount += 1
//                    break
//                } else {
//                    column.append(c[i])
//                }
//            }
//            index += 1
//        }
//        return deletedCount
//    }
//}


//해법보고 수정한 버전..결국 for문을 1부터도느냐 0부터 다시도느냐에 따라 실패/성공나뉨.. 로직은 비슷..
class Solution {
    func minDeletionSize(_ strs: [String]) -> Int {
        
        let length = strs.first!.count
        var deletedCount = 0
        
        for k in 0..<length {
            let first = strs.first!
            let i = first.index(first.startIndex, offsetBy: k)
            for j in 1..<strs.count {
                if strs[j][i] < strs[j - 1][i] {
                    deletedCount += 1
                    break
                }
            }
        }
        return deletedCount
    }
}

print(Solution().minDeletionSize(["cba","daf","ghi"]))
