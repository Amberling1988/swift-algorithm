/*
 给你一个整数数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。

 返回滑动窗口中的最大值。

  

 示例 1：

 输入：nums = [1,3,-1,-3,5,3,6,7], k = 3
 输出：[3,3,5,5,6,7]
 解释：
 滑动窗口的位置                最大值
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
 示例 2：

 输入：nums = [1], k = 1
 输出：[1]
 示例 3：

 输入：nums = [1,-1], k = 1
 输出：[1,-1]
 示例 4：

 输入：nums = [9,11], k = 2
 输出：[11]
 示例 5：

 输入：nums = [4,-2], k = 2
 输出：[4]
  

 提示：

 1 <= nums.length <= 105
 -104 <= nums[i] <= 104
 1 <= k <= nums.length

 */

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
        var removLeft = false
        for (_,item) in nums.enumerated() {
            
            // 首次添加窗口
            if count < k {
                count += 1
                window.append(item)
                
                if count == k {
                    // 确定最大值位置
                    for i in 1..<window.count {
                        if window[i] >= window[maxIndex] {
                            maxIndex = i
                        }
                    }
                    removLeft = true
                }
                
            }else {
                
                // 滑动窗口
                if window.count == k {
                    
                    window.removeFirst()
                    window.append(item)
                    
                    // 重新确定最大值位置
                    for i in 1..<window.count {
                        if window[i] >= window[maxIndex] {
                            maxIndex = i
                        }
                    }
                    removLeft = true
                }else {
                    window.append(item)
                    if item > window[maxIndex]{
                        maxIndex = window.count-1
                        removLeft = true
                    }else {
                        resultArray.append(window[0])
                        removLeft = false
                    }
                    
                }
            
            }
            
            if count == k ,removLeft == true{
               
                // 删除最大值左侧所有元素
                if maxIndex > 0 {

                    window.removeSubrange(0..<maxIndex)
                }
                maxIndex = 0
                resultArray.append(window[0])
                
            }
   
        }
        return resultArray
        
    }
}

let s = Solution()
let arr = s.maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3)

print(arr)
