

class Solution6 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        let s = Array(haystack), p = Array(needle)
        guard p.count != 0 else { return 0 }
        
        var j = -1
        var next = [Int].init(repeating: 0, count: p.count)
        getNext(&next, p)
        
        return -1
    }
    
    // 前缀表后移一位，首位用 -1 填充
    func getNext(_ next: inout [Int], _ needle: [Character]) {
        
        var j = -1
        next[0] = -1
        
        for i in 1 ..< needle.count {
            
            while j > 0 && needle[i] != needle[j] {
                j = next[j]
            }
            
            if needle[i] == needle[j] {
                j += 1
            }
            
            next[i] = j
        }
        print(next)
    }
}

let s = Solution6()
s.strStr("aabaabaaf", "aabaaf")
