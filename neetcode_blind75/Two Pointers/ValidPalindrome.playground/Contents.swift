import Foundation

func isPalindrome(_ s: String) -> Bool {
    let removeChars = CharacterSet.alphanumerics.inverted
    let removed = s.components(separatedBy: removeChars).joined(separator: "").lowercased()
    
    // simple solution using reversed
//    return removed == String(removed.reversed())
    
    // solution using two index pointer
    var left = 0
    var right = max(removed.count - 1, 0)
    
    let strArray = Array(removed)
    while left < right {
        if strArray[left] == strArray[right] {
            left += 1
            right -= 1
            continue
        } else {
            return false
        }
    }
    
    return true
}
print(isPalindrome("race a car"))
