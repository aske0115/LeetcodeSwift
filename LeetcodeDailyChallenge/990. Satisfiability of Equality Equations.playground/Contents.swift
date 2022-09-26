/**
 990. Satisfiability of Equality Equations
 Medium

 1898

 24

 Add to List

 Share
 You are given an array of strings equations that represent relationships between variables where each string equations[i] is of length 4 and takes one of two different forms: "xi==yi" or "xi!=yi".Here, xi and yi are lowercase letters (not necessarily different) that represent one-letter variable names.

 Return true if it is possible to assign integers to variable names so as to satisfy all the given equations, or false otherwise.

  

 Example 1:

 Input: equations = ["a==b","b!=a"]
 Output: false
 Explanation: If we assign say, a = 1 and b = 1, then the first equation is satisfied, but not the second.
 There is no way to assign the variables to satisfy both equations.
 Example 2:

 Input: equations = ["b==a","a==b"]
 Output: true
 Explanation: We could assign a = 1 and b = 1 to satisfy both equations.
  

 Constraints:

 1 <= equations.length <= 500
 equations[i].length == 4
 equations[i][0] is a lowercase letter.
 equations[i][1] is either '=' or '!'.
 equations[i][2] is '='.
 equations[i][3] is a lowercase letter.
 Accepted
 60,653
 Submissions
 119,475
 */

class Solution {
    func equationsPossible(_ equations: [String]) -> Bool {
        
        func isEqual(_ str: String) -> Bool {
            return str == "=="
        }
        
        var hashMap: [String: Int] = [:]
        
        for operation in equations {
            var operations = operation
            var firstValue = operations.removeFirst()
            var lastValue = operations.removeLast()
            var isEqual = isEqual(operations)
        
            if hashMap[String(firstValue)] == nil {
                hashMap[String(firstValue)] = Int(firstValue.asciiValue!)
                if isEqual {
                    if hashMap[String(lastValue)] == nil {
                        
                        hashMap[String(lastValue)] = Int(firstValue.asciiValue!)
                    } else {
                        hashMap[String(firstValue)] = hashMap[String(lastValue)]!
                    }
                } else {
                    if hashMap[String(lastValue)] == nil {
                        hashMap[String(lastValue)] = Int(lastValue.asciiValue!)
                    } else {
                        print(firstValue)
                        hashMap[String(firstValue)] = Int(firstValue.asciiValue!)
                    }
                }
            }
            else if hashMap[String(lastValue)] == nil {
                if isEqual {
                    if let value = hashMap[String(firstValue)] {
                        if hash.count > 0 {
                            hashMap[String(lastValue)] = hash.first!
                        }
                    } else {
                        hashMap[String(lastValue)] = Int(firstValue.asciiValue!)
                    }
                } else {
                    hashMap[String(lastValue)] = Int(lastValue.asciiValue!)
                }
            } else {
                if isEqual {
                    hashMap[String(firstValue)] = hashMap[String(lastValue)]!
                }
            }
            print(hashMap)
        }
        print(hashMap)
        for operation in equations {
            var operations = operation
            var firstValue = operations.removeFirst()
            var lastValue = operations.removeLast()
            var isEqual = isEqual(operations)
            
            if let value = hashMap[String(firstValue)], let value2 = hashMap[String(lastValue)] {
                if isEqual, value != value2 {
                    return false
                } else if !isEqual, value == value2 {
                    return false
                }
            }
        }
        return true
    }
}

let sol = Solution()
print(sol.equationsPossible(["i!=c","i!=f","k==j","g==e","h!=e","h==d","j==e","k==a","i==h"]))
