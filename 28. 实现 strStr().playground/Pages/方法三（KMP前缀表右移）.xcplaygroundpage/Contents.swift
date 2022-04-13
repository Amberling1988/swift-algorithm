

class Solution6 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        let s = Array(haystack), p = Array(needle)
        guard p.count != 0 else { return 0 }
        
        var j = 0
        var next = [Int].init(repeating: 0, count: p.count)
        getNext(&next, p)
         
        for i in 0 ..< s.count {
            
            while j > 1 && s[i] != p[j] {
                j = next[j]
            }
            
            if s[i] == p[j] {
                j += 1
            }
            
            if j == p.count {
                return i - p.count + 1
            }
        }
        
        return -1
    }
    
    // 前缀表后移一位，首位用 -1 填充
    func getNext(_ next: inout [Int], _ needle: [Character]) {
        
        guard needle.count > 1 else { return }
        
        var j = 0
        next[0] = j
        
        for i in 1 ..< needle.count-1 {
           
            while j > 0 && needle[i] != needle[j] {
                j = next[j-1]
            }
            
            if needle[i] == needle[j] {
                j += 1
            }
            
            next[i] = j
        }
        next.removeLast()
        next.insert(-1, at: 0)
        print(next)
    }
}

let s = Solution6()
s.strStr("a", "a") //0 1 0 1 2 0
