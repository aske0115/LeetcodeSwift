import Darwin
/**
 1680. Concatenation of Consecutive Binary Numbers
 Medium

 699

 310

 Add to List

 Share
 Given an integer n, return the decimal value of the binary string formed by concatenating the binary representations of 1 to n in order, modulo 109 + 7.

  

 Example 1:

 Input: n = 1
 Output: 1
 Explanation: "1" in binary corresponds to the decimal value 1.
 Example 2:

 Input: n = 3
 Output: 27
 Explanation: In binary, 1, 2, and 3 corresponds to "1", "10", and "11".
 After concatenating them, we have "11011", which corresponds to the decimal value 27.
 Example 3:

 Input: n = 12
 Output: 505379714
 Explanation: The concatenation results in "1101110010111011110001001101010111100".
 The decimal value of that is 118505380540.
 After modulo 109 + 7, the result is 505379714.
  

 Constraints:

 1 <= n <= 105
 Accepted
 50,843
 Submissions
 92,625
 */


class Solution {
    func concatenatedBinary(_ n: Int) -> Int {
    //timeOut 나서 베껴옴..
//        let modulo = 1000000007
//        var resultString : [Bool] = []
//
//        for i in 1...n {
//            resultString += binary(i)
//        }
//
//        func binary(_ n: Int) -> [Bool] {
//            var i = n
//            var result = [Bool]()
//            while i != 0 {
//                if i % 2 != 0 {
//                    result.insert(true, at: 0)
//                } else {
//                    result.insert(false, at: 0)
//                }
//                i /= 2
//            }
//            return result
//        }
//
//        var result = 0
//
//
//        for bool in  resultString {
//            result = result * 2 % modulo
//            if bool {
//                result += 1
//            }
//        }
//        return result

        
        //원래 내 풀이.. 답은 맞는데 시간제한에서 걸림.
        //그래도 머리싸메고 고민해서 답은 맞췄으니 기록해둠,.
        let modulo = 1000000007
                var resultString = ""
                for i in 1...n {
                    resultString += String(i, radix: 2)
                }
                
                func hex(_ str: String) -> Int {
                            var sum: Int = 0
                            var digit: Int = 1
                            for i in stride(from:str.count - 1, through: 0, by : -1) {
                                if let value = str[str.index(str.startIndex, offsetBy: i)].wholeNumberValue {
                                    if value == 0 {
                                        if digit > modulo {
                                            digit = digit % modulo
                                        }
                                        digit *= 2
                                    } else {
                                        sum += digit % modulo
                                        if digit > modulo {
                                            digit = digit % modulo
                                        }
                                        digit *= 2
                                    }
                                }
                            }
                            
                            return Int(sum % modulo)
                        }

                return hex(resultString)
    }
}


let sol = Solution()
print(sol.concatenatedBinary(42))
