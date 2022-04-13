

class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        
        let sArr = Array(s)
        let len = s.count
        if len == 0 {
            return false
        }
        
        var next = Array.init(repeating: -1, count: len)
        getNext(&next, sArr)
        
        if next[len-1] != -1 && len % (len - (next[len-1] + 1) ) == 0 {
            return true
        }
        
        
        return false
    }
    
    // 前缀表统一减一
    func getNext(_ next: inout [Int], _ sArr:[Character]) {
        
        var j = -1
        next[0] = j
        
        for i in 1 ..< sArr.count {
            while j >= 0 && sArr[i] != sArr[j+1] {
                j = next[j]
            }
            
            if sArr[i] == sArr[j+1] {
                j += 1
            }
            
            next[i] = j
        }
    }
}


let s = Solution()
s.repeatedSubstringPattern("abcabcabcabc")
