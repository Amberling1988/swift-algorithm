/*
 剑指 Offer 05. 替换空格
 
 请实现一个函数，把字符串 s 中的每个空格替换成"%20"。

 示例 1：
 输入：s = "We are happy."
 输出："We%20are%20happy."
  
 限制：
 0 <= s 的长度 <= 10000
 */

/// 节省存储空间
class Solution {
    func replaceSpace(_ s: String) -> String {

        var sArr = Array(s)
        var spaceCount = 0

        for c in sArr {
            if c == " " {
                spaceCount += 1
            }
        }
        if spaceCount == 0 {
            return s
        }
        var left = sArr.count-1
        /// 扩容
        for _ in 0...spaceCount*2-1{
            sArr.append(" ")
        }
        var right = sArr.count-1
        
        while left < right {
            if sArr[left] == " " {
                sArr[right] = "0"
                sArr[right-1] = "2"
                sArr[right-2] = "%"
                
                left -= 1
                right -= 3
            }else {
                sArr[right] = sArr[left]
                left -= 1
                right -= 1
            }
        }
        
        return String(sArr)
    }
}

let s = Solution()
s.replaceSpace("abc")
