/*
 给你一个字符串表达式 s ，请你实现一个基本计算器来计算并返回它的值。
 
 示例 1：

 输入：s = "1 + 1"
 输出：2
 示例 2：

 输入：s = " 2-1 + 2 "
 输出：3
 示例 3：

 输入：s = "(1+(4+5+2)-3)+(6+8)"
 输出：23
  

 提示：

 1 <= s.length <= 3 * 105
 s 由数字、'+'、'-'、'('、')'、和 ' ' 组成
 s 表示一个有效的表达式
 
 */

/*
 出错点：
    1, 多位数
    2, 过滤空格" "
    3, 负数：出现位置：首个数字或者"("后第一个数字会出现负数
    4, -(xxxx) 情况
 */

import Foundation

class Solution {
    func calculate(_ s: String) -> Int {
        
        /// 过滤空格
        let pureS = s.replacingOccurrences(of: " ", with: "")

        var numStack:[Int] = []
        var operatorStack:[Character] = []
        var res = 0
        /// 用来判断多位数
        var numcount = 0
        /// 标识左括号
        var isLeftBracket = true
        
        pureS.forEach { c in
            
            if c == "-" {
                if isLeftBracket {
                    /// 负数补0
                    numStack.append(0)
                }
                operatorStack.append(c)
                
                numcount = 0
                isLeftBracket = false
                
            }else if c == "(" {
     
                operatorStack.append(c)
                numcount = 0
                isLeftBracket = true
                
            }else if c == "+" {
                operatorStack.append(c)
                numcount = 0
                isLeftBracket = false
                
            }else if c == ")"{
                var subRes = 0
                while operatorStack.last != "(" {
                    let num = numStack.popLast()!
                    let operatorStr = operatorStack.popLast()
                    
                    if operatorStr == "+" {
                        subRes += num
                    }else if operatorStr == "-" {
                        subRes -= num
                    }
                }
            
                subRes += numStack.popLast()!
                /// "(" 出栈
                operatorStack.popLast()
                /// 入栈计算结果
                numStack.append(subRes)
                
                numcount = 0
                isLeftBracket = false
                
            }else {
                
                /// 数字入栈(数字不改变正负)
                if numcount > 0 {
                    /// 多位数
                    var num = numStack.popLast()!
                    num = num*10 + Int(String(c))!
                    numStack.append(num)
                    
                }else{
                    /// 单位数
                    numStack.append(Int(String(c))!)
                }
                numcount += 1
                isLeftBracket = false
                
            }
        }
        
    
        
        while !operatorStack.isEmpty {
            let operatorStr = operatorStack.popLast()
            if operatorStr == "+" {
                res += numStack.popLast()!
            }else if operatorStr == "-" {
                res -= numStack.popLast()!
            }
        }

        res += numStack.popLast()!
        
        return res

    }
}

var s = Solution()
s.calculate("- (3-(4+5))")
