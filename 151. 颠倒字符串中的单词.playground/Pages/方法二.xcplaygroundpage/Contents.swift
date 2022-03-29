class Solution {
    func reverseWords(_ s: String) -> String {
        var stringArr = removeSpace(s)
        reverseString(&stringArr, startIndex: 0, endIndex: stringArr.count - 1)
        reverseWord(&stringArr)
        return String(stringArr)
    }

    /// 1、移除多余的空格（前后所有的空格，中间只留一个空格）
    func removeSpace(_ s: String) -> [Character] {
        let ch = Array(s)
        var left = 0
        var right = ch.count - 1
        // 忽略字符串前面的所有空格
        while ch[left] == " " {
            left += 1
        }
        // 忽略字符串后面的所有空格
        while ch[right] == " " {
            right -= 1
        }

        // 接下来就是要处理中间的多余空格
        var lastArr = Array<Character>()
        while left <= right {
            // 准备加到新字符串当中的字符
            let char = ch[left]
            // 新的字符串的最后一个字符；或者原字符串中，准备加到新字符串的那个字符；这两个字符当中，只要有一个不是空格，就可以加到新的字符串当中
            if char != " " || lastArr[lastArr.count - 1] != " "  {
                lastArr.append(char)
            }
          
            left += 1
        }
        return lastArr
    }

    /// 2、反转整个字符串
    func reverseString(_ s: inout [Character], startIndex: Int, endIndex: Int)  {
        var start = startIndex
        var end = endIndex
        while start < end {
            (s[start], s[end]) = (s[end], s[start])
            start += 1
            end -= 1
        }
    }

    /// 3、再次将字符串里面的单词反转
    func reverseWord(_ s: inout [Character]) {
        var start = 0
        var end = 0
        var entry = false

        for i in 0..<s.count {
            if !entry {
                start = i
                entry = true
            }
          
            if entry && s[i] == " " && s[i - 1] != " " {
                end = i - 1
                entry = false
                reverseString(&s, startIndex: start, endIndex: end)
            }

            if entry && (i == s.count - 1) && s[i] != " " {
                end = i
                entry = false
                reverseString(&s, startIndex: start, endIndex: end)
            }
        }
    }
}
