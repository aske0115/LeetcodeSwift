class Solution {
    func myAtoi(_ s: String) -> Int {
        var isNegative = false
        var resultString = ""
        var removeWhiteSpaceString = ""
        let stringArray = s.map { String($0) }
        if let firstIndex = stringArray.firstIndex(where: { $0 != " "}) {
            let arr = Array(stringArray[firstIndex..<stringArray.count])
            if let first = arr.first {
                if Int(String(first)) == nil && (String(first) != "-" && String(first) != "+") {
                    return 0
                }
            }
            removeWhiteSpaceString = arr.joined(separator: "")
        }
        var checkNonDigit = false

        for i in removeWhiteSpaceString {
           
            if i == "." {
                break
            }
            
            if i == "+" {
                if checkNonDigit == true || resultString.count > 0{
                    break
                }
                checkNonDigit = true
                continue
            }
            
            if i == "-" {
                if checkNonDigit == true || resultString.count > 0 {
                    break
                }
                checkNonDigit = true
                isNegative = true
                continue
            }
            
            if let integer = Int(String(i)) {
                resultString += String(i)
                checkNonDigit = false
                
                if let result = Int(resultString) {
                    let resultInteger = result * (isNegative ? -1 : 1)
                    if resultInteger < Int32.min || resultInteger > Int32.max {
                        break
                    }
                }
            } else {
                if checkNonDigit == true  || resultString.count > 0  {
                    break
                }
                checkNonDigit = true
            }
        }
        
        if let result = Int(resultString) {
            let resultInteger = result * (isNegative ? -1 : 1)
            if resultInteger < Int32.min {
                 return Int(Int32.min)
            } else if resultInteger > Int32.max {
                return Int(Int32.max)
            } else {
                return resultInteger
            }
         }
        
        return 0
    }
}
