
class Solution2 {
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        let h = Array(haystack), n = Array(needle)
        if h.count < n.count {
            return -1
        }
        
        if n.count == 0 {
            return 0
        }
        
        var j = 0
        var next = Array(repeating: 0, count: n.count)
        getNext(&next, n)
        
        for i in 0 ..< h.count {
            
            while j > 0 && h[i] != n[j] {
                j = next[j-1]
            }
            
            if h[i] == n[j] {
                j += 1
            }
            
            // 易错
            if j == n.count {
                return i - (n.count - 1)
            }
        }
        
        return -1
    }
    
    func getNext(_ next: inout [Int], _ needle:[Character]) {
        
        var j = 0
        next[0] = j
        
        for i in 1 ..< needle.count {
            
            while j > 0 && needle[i] != needle[j] {
                j = next[j-1]
            }
            
            if needle[i] == needle[j] {
                j += 1
            }
            
            next[i] = j
        }
       
        print(next)
    }
}

let s = Solution2()
s.strStr("abcaabcd", "abcabc")
