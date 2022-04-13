


class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        
        let sArr = Array(s)
        let len = sArr.count
        if len == 0 {
            return false
        }
        
        var next = Array.init(repeating: 0, count: len)
        getNext(&next, sArr)
        
        if next[len-1] != 0 && len % (len - next[len-1]) == 0 {
            return true
        }
        
        return false
    }
    
    // 前缀表不减一
    func getNext(_ next: inout [Int], _ sArr:[Character]) {
        
        var j = 0
        next[0] = 0
        
        for  i  in 1 ..< sArr.count {
            while j > 0 && sArr[i] != sArr[j] {
                j = next[j-1]
            }
            
            if sArr[i] == sArr[j] {
                j += 1
            }
            
            next[i] = j
        }
    }
}

let s = Solution()
s.repeatedSubstringPattern("abcabcabcc")
