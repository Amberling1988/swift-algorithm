import Cocoa

/*
给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

示例 1:
输入: 123
输出: 321
 
示例 2:
输入: -123
输出: -321

示例 3:
输入: 120
输出: 21
 
注意:
假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231,  231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
 */

class Solution {
    func reverse(_ x: Int) -> Int {
        
        var num = x
        var reverseNum = 0
        
        while num != 0 {
            
            let a = num % 10
            // 处理反转数据0开头问题
            if a != 0 || reverseNum != 0 {
                reverseNum = reverseNum*10 + a
                if (reverseNum > Int32.max) || (reverseNum < Int32.min) {
                    return 0
                }
                
            }
            num /= 10
        }
        
        return reverseNum
    }
    /*
    func reverse(_ x: Int) -> Int {
        
        var num:Int
        if x<0 {
            num = -x
        }else{
            num = x
        }
        
        var reverseNum = 0
        while num > 0 {
            
            let a = num % 10
            // 处理反转数据0开头问题
            if a>0 || reverseNum>0 {
                reverseNum = reverseNum*10 + a
                if (reverseNum > Int64.max) || (-reverseNum < Int64.min) {
                    return 0
                }
              
            }
            num /= 10
        }
        
        if x<0 {
            reverseNum *= -1
        }
        
        
        return reverseNum
    }
 */
}
