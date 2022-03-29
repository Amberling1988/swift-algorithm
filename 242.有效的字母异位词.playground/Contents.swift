/*
 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。

 注意：若 s 和 t 中每个字符出现的次数都相同，则称 s 和 t 互为字母异位词。

  

 示例 1:

 输入: s = "anagram", t = "nagaram"
 输出: true
 示例 2:

 输入: s = "rat", t = "car"
 输出: false
  

 提示:

 1 <= s.length, t.length <= 5 * 104
 s 和 t 仅包含小写字母

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/valid-anagram
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        
        if s.count != t.count {
            return false
        }
        
        var record = Array(repeating: 0, count: 26)
        let aUnicodeScalar = "a".unicodeScalars.first!.value
        
        for c in s.unicodeScalars {
            record[Int(c.value - aUnicodeScalar)] += 1
        }
        
        for c in t.unicodeScalars {
            record[Int(c.value - aUnicodeScalar)] -= 1
        }
        
        for value in record {
            if value != 0 {
                return false
            }
        }
        
        return true
    }
}

let s = Solution()
let res = s.isAnagram("abccg", "cbacg")
print(res)
