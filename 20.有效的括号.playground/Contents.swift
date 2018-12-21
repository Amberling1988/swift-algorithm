/*给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

有效字符串需满足：

左括号必须用相同类型的右括号闭合。
左括号必须以正确的顺序闭合。
注意空字符串可被认为是有效字符串。
 
 示例 1:
 输入: "()"
 输出: true
 示例 2:
 
 输入: "()[]{}"
 输出: true
 
 示例 3:
 输入: "(]"
 输出: false
 
 示例 4:
 输入: "([)]"
 输出: false

 示例 5:
 输入: "{[]}"
 输出: true
*/

import Cocoa

class Solution {
    func isValid(_ s: String) -> Bool {
        if s.isEmpty {
            return true
        }
        
        let mapping = [ "(": ")", "{":"}", "[":"]" ]
        var array = [String]()
        
        // 遍历字符串
        for character in s {
            let str = String(character)
            
            if mapping.keys.contains(str){
                // 左括号，加入数组中（注意，要加入数组尾部，不能插入到头部，如果是插入到头部，数组是一组连续的内存空间，如果在头部插入数据，后面所有数据的内存地址都要向后移，增加空间复杂度）
                array.append(str)
            }else {
                //
                guard let lastStr = array.last, str == mapping[lastStr] else {
                    return false
                }
                
                // 与数组最后一位匹配括号，匹配上则pop
                array.popLast()
            }
            
        }
     
        return array.isEmpty
    }
}

var solution = Solution()
solution.isValid("((((()")
