import Cocoa


// 比方法一慢
class Solution2 {
    func isPalindrome(_ x: Int) -> Bool {
        
        if x < 0 {
            return false
        }
        
        let num:String = String(x)
        var otherNum = num
        
        for charater in num {
            if charater != otherNum.last {
                return false
            }
            
            otherNum.removeLast()
        }
        
        
        return true
        
    }
}

class Solution1 {
    func isPalindrome(_ x: Int) -> Bool {
        
        if x < 0 {
            return false
        }
        
        var num = x
        var reverseNum = 0
        
        while num > 0 {
            
            let a = num % 10
            if a != 0 || reverseNum != 0 {
                reverseNum = reverseNum * 10 + a
            }else{
                return false
            }
            num /= 10
        }
        
        return (reverseNum == x)
        
    }
}
