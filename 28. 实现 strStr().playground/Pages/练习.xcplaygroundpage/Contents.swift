
class Solution2 {
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        let s = Array(haystack), p = Array(needle)
        guard p.count != 0 else { return 0}

        // KMP
        var j = 0
        var next = [Int].init(repeating: 0, count: p.count)
        getNext(&next, p)
        
        for i in 0 ..< s.count {
            
            while j > 0 && s[i] != p[j] {
                j = next[j-1]
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
    
    func getNext(_ next: inout [Int], _ needle:[Character]) {
        
        var j = 0
        next[0] = j // 单个字符相等前缀个数为0
        
        for i in 1 ..< needle.count {
            
            // 处理前后缀不相等情况
            while j > 0 && needle[i] != needle[j] {
                // 取前一位下标对应的next值进行回退，退到首位为极限情况
                j = next[j-1]
            }
            // 处理前后缀相等情况
            if needle[i] == needle[j] {
                j += 1
            }
            // 填充next表
            next[i] = j
            
        }
    }
}

let s = Solution2()
s.strStr("aabaabaaf", "aabaaf")
