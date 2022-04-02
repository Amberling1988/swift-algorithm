
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        let s = Array(haystack), p = Array(needle)
        guard p.count != 0 else { return 0 }
        

        var j = 0
        var next = [Int](repeating: 0, count: needle.count)
        // KMP
        getNext(&next, needle: p)
        
        for i in 0 ..< s.count {
            while j > 0 && s[i] != p[j] {
                //不匹配之后寻找之前匹配的位置
                j = next[j-1]
            }
            if s[i] == p[j] {
                //匹配，双指针同时后移
                j += 1
            }
            print(j,i)
            if j == p.count {
                //出现匹配字符串
                return i - p.count + 1
            }
        }
        return -1
    }

    //前缀表
    func getNext(_ next: inout [Int], needle: [Character]) {
       
        var j = 0
        next[0] = j
        
        for i in 1 ..< needle.count {
            
            while j>0 && needle[i] != needle[j] {
                j = next[j-1]
            }
            
            if needle[i] == needle[j] {
                j += 1
            }
            
            next[i] = j
            
        }
    }
}

let s = Solution()
s.strStr("aabaabaaf", "aabaaf")
