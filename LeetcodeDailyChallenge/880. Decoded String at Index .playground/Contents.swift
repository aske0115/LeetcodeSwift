import Foundation

class Solution {
    func decodeAtIndex(_ s: String, _ k: Int) -> String {

        //곱셈을 언제까지 할지 체크
        func checkContinueDecode(_ s: String) -> Int {
            var count = 1
            while (s.firstIndex(where: { !$0.isWholeNumber }) != nil && count < k) {
                if let index = s.firstIndex(where: { !$0.isWholeNumber }), let loop = s[index].wholeNumberValue {
                    count *= loop
                }
            }
            return count
        }
        
        var string = ""
        var origin: String = s
        var charIndex = s.startIndex
        var numberIndex = s.startIndex
        while(origin.firstIndex(where: { $0.isWholeNumber }) != nil) {
           
            if let index = origin.firstIndex(where: { $0.isWholeNumber }), let count = origin[index].wholeNumberValue {
                let ss = origin[origin.startIndex..<index]
                string += ss
                let repeatString = string

                print(checkContinueDecode(repeatString))
                for _ in 0..<count - 1 {
                    if string.count > k {
                        origin = ""
                        break
                    }
                     string += repeatString
                }
          
                if !origin.isEmpty, index != origin.endIndex {
                    let substring = origin[origin.index(index, offsetBy: 1)..<origin.endIndex]
                        origin = String(substring)
                }
                numberIndex = origin.startIndex
            }
            if string.count > k {
                break
            }
        }
        
        if numberIndex != s.endIndex, string.count <= k {
            string += origin[numberIndex..<origin.endIndex]
        }
        return String(string[string.index(string.startIndex, offsetBy: k - 1)])
    }
}
