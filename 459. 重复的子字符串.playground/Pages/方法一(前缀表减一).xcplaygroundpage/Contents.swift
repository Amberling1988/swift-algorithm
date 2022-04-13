
/*
 459. 重复的子字符串
 给定一个非空的字符串 s ，检查是否可以通过由它的一个子串重复多次构成。

  

 示例 1:
 输入: s = "abab"
 输出: true
 解释: 可由子串 "ab" 重复两次构成。
 
 示例 2:
 输入: s = "aba"
 输出: false
 
 示例 3:
 输入: s = "abcabcabcabc"
 输出: true
 解释: 可由子串 "abc" 重复四次构成。 (或子串 "abcabc" 重复两次构成。)
  
 提示：
 1 <= s.length <= 104
 s 由小写英文字母组成

 */

class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        
        let sArr = Array(s)
        let len = s.count
        if len == 0 {
            return false
        }
        var next = Array.init(repeating: -1, count: len)
        
        getNext(&next,sArr)
        
        if next.last != -1 && len % (len - (next[len-1] + 1)) == 0{
            return true
        }

        return false
    }
    // a a b a a f
    // 0 1 0 1 2 0
    // 前缀表统一减一
    func getNext(_ next: inout [Int], _ str:[Character]) {
        
        var j = -1 // 前缀末尾
        next[0] = j
        
        for i in 1 ..< str.count {
            // i 后缀末尾索引
            // j 1,前缀末尾索引、2，next[i]的值
            // 处理前后缀不相等
            while j >= 0 && str[j+1] != str[i] {
                // 回退到前一位下标对应的next值
                j = next[j]
            }
            
            // 处理前后缀相等(双指针后移)
            if str[i] == str[j+1] {
                j += 1
            }
            
            // 更新next数组
            next[i] = j
            
        }
        
    }
}

let s = Solution()
s.repeatedSubstringPattern("abcabcabcabc")
