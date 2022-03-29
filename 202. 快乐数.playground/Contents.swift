
class Solution {
    // number 每个位置上的数字的平方和
    func getSum(_ number: Int) -> Int {
        
        var sum = 0
        var num = number
        
        while num > 0 {
            let tmp = num % 10
            sum += tmp*tmp
            
            num /= 10
        }
       return sum
    }
    func isHappy(_ n: Int) -> Bool {
        var set = Set<Int>()
        var sum = 0
        var num = n
        while true {
            sum = getSum(num)
            
            if sum == 1 {
                return true
            }
            
            if set.contains(sum) {
                return false
            }else {
                set.insert(sum)
            }
            
            num = sum
        }
    }
}

let s = Solution()
s.isHappy(19)
