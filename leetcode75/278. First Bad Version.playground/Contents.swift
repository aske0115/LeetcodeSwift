/**
 278. First Bad Version
 Easy

 6119

 2312

 Add to List

 Share
 You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

 Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.

 You are given an API bool isBadVersion(version) which returns whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.

  

 Example 1:

 Input: n = 5, bad = 4
 Output: 4
 Explanation:
 call isBadVersion(3) -> false
 call isBadVersion(5) -> true
 call isBadVersion(4) -> true
 Then 4 is the first bad version.
 Example 2:

 Input: n = 1, bad = 1
 Output: 1
  

 Constraints:

 1 <= bad <= n <= 231 - 1
 */


func isBadVersion(_ version: Int) -> Bool {
    return version >= 1702766719
}

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        badVersionInRange( 1, n)
    }
    func badVersionInRange(_ lower: Int, _ upper: Int) -> Int {
        let mid: Int = (upper - lower) / 2 + lower
        // bad version is at left side
        if isBadVersion(mid) {
            return mid <= lower ? mid : badVersionInRange(lower, mid - 1)
        }
        // bad version is at right side
        return badVersionInRange(mid + 1, upper)
    }
}

let sol = Solution()
print(sol.firstBadVersion(2126753390))
