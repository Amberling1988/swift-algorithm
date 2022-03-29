/*
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 
 示例 1:
 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 
 示例 2:
 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 
 示例 3:
 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
 请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 
 
 */

/// 暴力法（想法是滑动窗口）

import Cocoa

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
       
        if s.count <= 1 {
            return s.count
        }

        let sArray = Array(s)

        var len = 1
        var subArr = [sArray[0]]
        
        for i in 1...sArray.count-1 {
            
            let tmp = sArray[i]
            if subArr.contains(tmp){
                
                if subArr.count > len {
                    len = subArr.count
                }
                
                // 获取重复字符位置
                let findIndex = subArr.firstIndex(where: { (e) -> Bool in
                    return (e == tmp)
                })
                subArr = subArr.suffix(subArr.count-findIndex!-1)
                subArr.append(tmp)
                
            }else {
                subArr.append(tmp)
                if subArr.count > len {
                    len = subArr.count
                }
            }
        }
print(subArr)
        return len
    }
}

var s = Solution()
s.lengthOfLongestSubstring("auggkktewi")
