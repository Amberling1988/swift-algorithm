
import Foundation
/*
实现 strStr() 函数。

给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串出现的第一个位置（下标从 0 开始）。如果不存在，则返回  -1 。

说明：
当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。
对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与 C 语言的 strstr() 以及 Java 的 indexOf() 定义相符。
 示例 1：
 输入：haystack = "hello", needle = "ll"
 输出：2
 
 示例 2：
 输入：haystack = "aaaaa", needle = "bba"
 输出：-1
 
 示例 3：
 输入：haystack = "", needle = ""
 输出：0

 提示：
 0 <= haystack.length, needle.length <= 5 * 104
 haystack 和 needle 仅由小写英文字符组成
*/

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
s.strStr("ba", "a")
