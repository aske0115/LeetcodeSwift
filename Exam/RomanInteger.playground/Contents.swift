/**
 13. Roman to Integer
 Easy

 5291

 335

 Add to List

 Share
 Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

 Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

 I can be placed before V (5) and X (10) to make 4 and 9.
 X can be placed before L (50) and C (100) to make 40 and 90.
 C can be placed before D (500) and M (1000) to make 400 and 900.
 Given a roman numeral, convert it to an integer.

  

 Example 1:

 Input: s = "III"
 Output: 3
 Explanation: III = 3.
 Example 2:

 Input: s = "LVIII"
 Output: 58
 Explanation: L = 50, V= 5, III = 3.
 Example 3:

 Input: s = "MCMXCIV"
 Output: 1994
 Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
  

 Constraints:

 1 <= s.length <= 15
 s contains only the characters ('I', 'V', 'X', 'L', 'C', 'D', 'M').
 It is guaranteed that s is a valid roman numeral in the range [1, 3999].
**/


class Solution {

    func romanToInt(_ s: String) -> Int {
        //문자열을 앞에서 쪼개본다
        //문자열이 i,x,c일경우 다음의 문자가 (v,x)(l,c)(d,m)인지 확인한다.
        //문자열이 i,x,c가 아닐 경우 각각 치환되어질 숫자를 합한다.
        //다 합친 결과값을 리턴해준다.
        //1, 문자열 쪼개기
        
        var result: Int = 0
        
        var startIndex = 0
        while startIndex < s.count {
            let res = checkRoman(s, startIndex: startIndex)
            startIndex = res.lastOffeset
            result += res.result
        }
        
        return result
    }
    
    func checkRoman(_ s: String , startIndex: Int) -> (result: Int, lastOffeset: Int) {
        
        let mapStr = s.map {
            String($0)
        }
        var checkedIndex =  min(s.count , startIndex + 1)

        let first = mapStr[startIndex]
        let offset = checkedIndex == s.count ? nil :  mapStr[checkedIndex]
    
        if first != offset, offset != nil, checkTwoRoman(first+offset!) {
            checkedIndex += 1
        }
        
        let checkStr = mapStr[startIndex..<min(s.count,checkedIndex)].joined(separator: "")
      
        switch checkStr {
        case "IV":
            return (4, checkedIndex)
        case "IX":
            return (9, checkedIndex)
        case "XL":
            return (40, checkedIndex)
        case "XC":
            return (90, checkedIndex)
        case "CD":
            return (400, checkedIndex)
        case "CM":
            return (900, checkedIndex)
        case "I":
            return (1, checkedIndex)
        case "V":
            return (5, checkedIndex)
        case "X":
            return (10, checkedIndex)
        case "L":
            return (50, checkedIndex)
        case "C":
            return (100, checkedIndex)
        case "D":
            return (500, checkedIndex)
        case "M":
            return (1000, checkedIndex)
        default:
            return (0,s.count)
        }
    }
    
    func checkTwoRoman(_ s: String) -> Bool {
        return s == "IV" || s == "IX" || s == "XL" || s == "XC" || s == "CD" || s == "CM"
    }
}

var sol = Solution()
sol.romanToInt("III")
