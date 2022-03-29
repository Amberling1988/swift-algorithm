import Foundation

class Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        
        var sArray:[Character] = []
        for c in s {
            if c == "#" {
                sArray.popLast()
            }else {
                sArray.append(c)
            }
        }
        
        var tArray:[Character] = []
        for c in t {
            if c == "#" {
                tArray.popLast()
            }else {
                tArray.append(c)
            }
        }
        
        if sArray == tArray {
            return true
        }
        
        return false
    }
}
var s = Solution()
s.backspaceCompare("a#b", "b")
