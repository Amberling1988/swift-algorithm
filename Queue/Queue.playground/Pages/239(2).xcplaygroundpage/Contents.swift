//: [Previous](@previous)

import Foundation

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        
        if k == 1 {
            return nums
        }
        
        var window:[Int] = []
        var resultArray:[Int] = []
        
        var count = 0
        var maxIndex = 0
        for (_,item) in nums.enumerated() {
            
            // 首次添加窗口
            if count < k {
                count += 1
                window.append(item)
                
                
                
            }else {
                
                // 滑动窗口
                if window.count == k {
                    
                    window.append(item)
                    
             
                }else {
                   
                    
                }
            
            }
            
        }
        return resultArray
        
    }
}

let s = Solution()
let arr = s.maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3)

print(arr)

