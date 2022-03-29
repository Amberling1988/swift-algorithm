

import Cocoa

class Solution {
    
    func twoSum(_ nums:[Int], _ target:Int) -> [Int] {
        
        // 值:index
        var resDict = [Int:Int]()
        
        for (i,value) in nums.enumerated() {
            let e = target - value
            
            if let v = resDict[e] {
                return [v,i]
            }else {
                resDict[value] = i
            }
        }
        
        return []
    }
}

let s = Solution()
s.twoSum([1,2,3,5,8,4],9)
