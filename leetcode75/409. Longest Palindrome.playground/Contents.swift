/**
 409. Longest Palindrome
 Easy

 3605

 214

 Add to List

 Share
 Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.

 Letters are case sensitive, for example, "Aa" is not considered a palindrome here.

  

 Example 1:

 Input: s = "abccccdd"
 Output: 7
 Explanation: One longest palindrome that can be built is "dccaccd", whose length is 7.
 Example 2:

 Input: s = "a"
 Output: 1
 Explanation: The longest palindrome that can be built is "a", whose length is 1.
  

 Constraints:

 1 <= s.length <= 2000
 s consists of lowercase and/or uppercase English letters only.
 */


class Solution {
    func longestPalindrome(_ s: String) -> Int {
        if s == String(s.reversed()) {
            return s.count
        }
        
        var dic = Dictionary( s.map { ($0, 1) }, uniquingKeysWith: +).sorted { $0.value > $1.value }
        var resultString = ""
        
        for (i,v) in dic {
            if v % 2 == 1, resultString.count % 2 == 0 {
                for j in 0..<v {
                    let index = resultString.index(resultString.startIndex, offsetBy: resultString.count / 2)
                    resultString.insert(i, at: index)
                }
            } else {
                var value = ""
                for j in 0..<(v / 2) {
                    value += String(i)
                }
                resultString = "\(value)" + resultString + "\(value)"
            }
        }
        return resultString.count
    }
}

let sol = Solution()
print(sol.longestPalindrome("civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"))
