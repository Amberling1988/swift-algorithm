
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        let s = Array(haystack), p = Array(needle)
        guard p.count != 0 else { return 0 }
        
        // 2 pointer
        var j = -1
        var next = [Int](repeating: -1, count: needle.count)
        // KMP
        getNext(&next, needle: p)
        for i in 0 ..< s.count {
            while j >= 0 && s[i] != p[j + 1] {
                //不匹配之后寻找之前匹配的位置
                j = next[j]
            }
            if s[i] == p[j + 1] {
                //匹配，双指针同时后移
                j += 1
            }
            if j == (p.count - 1) {
                //出现匹配字符串
                return i - p.count + 1
            }
        }
        return -1
    }

    //前缀表统一减一
    func getNext(_ next: inout [Int], needle: [Character]) {
        
        var j: Int = -1
        next[0] = j
        
        // i 从 1 开始
        for i in 1 ..< needle.count {
            print("i = \(i), j = \(j)")
            
            /// 处理前后缀不相同的情况
            while j >= 0 && needle[i] != needle[j + 1] {
                // j 回退到前一位next数组的值
                j = next[j]
            }
            /// 处理前后缀相同的情况
            if needle[i] == needle[j + 1] {
                j += 1;
            }
            next[i] = j
        }
        print(next)
    }
}

let s = Solution()
s.strStr("aabaabaaf", "aabaaf")


/*
aabaabaaf
aabaaf
 
前缀                           最长相等前后缀长度
a                                    0
aa  a | a                            1
aab a aa | b ab                      0
aaba a aa aab | a ba aba             1
aabaa a aa aab aaba | a aa baa abaa  2

 后缀
f
af
aaf
baaf
abaaf
 */
