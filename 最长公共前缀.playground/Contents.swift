
/*
编写一个函数来查找字符串数组中的最长公共前缀。

如果不存在公共前缀，返回空字符串 ""。

示例 1:
输入: ["flower","flow","flight"]
输出: "fl"
 
示例 2:
输入: ["dog","racecar","car"]
输出: ""
解释: 输入不存在公共前缀。

说明:
所有输入只包含小写字母 a-z
 */

import Cocoa


class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        if strs.count == 0 {
            return ""
        }else if strs.count == 1 {
            return strs[0]
        }
        let firtStr = strs[0]
        var prefixStr = String()
        for character in firtStr {
            prefixStr += String(character)
            for i in 1...strs.count-1 {
                let tmpHas = strs[i].hasPrefix(prefixStr)
                if tmpHas == false {
                    prefixStr.removeLast()
                    return prefixStr
                }
            }
            
        }
        
        return prefixStr
    }
    
}

var so = Solution()
var prefixStr = so.longestCommonPrefix(["flower","flow","flight"])

print("end prefixStr:\(prefixStr)")
