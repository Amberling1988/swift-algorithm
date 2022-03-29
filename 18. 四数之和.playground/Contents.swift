/*
 18. 四数之和
 给你一个由 n 个整数组成的数组 nums ，和一个目标值 target 。请你找出并返回满足下述全部条件且不重复的四元组 [nums[a], nums[b], nums[c], nums[d]] （若两个四元组元素一一对应，则认为两个四元组重复）：

 0 <= a, b, c, d < n
 a、b、c 和 d 互不相同
 nums[a] + nums[b] + nums[c] + nums[d] == target
 你可以按 任意顺序 返回答案 。

  

 示例 1：

 输入：nums = [1,0,-1,0,-2,2], target = 0
 输出：[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 示例 2：

 输入：nums = [2,2,2,2,2], target = 8
 输出：[[2,2,2,2]]
  

 提示：

 1 <= nums.length <= 200
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 */

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        
        var res = [[Int]]()
        let n = nums.count
        if n < 4 {
            return res
        }
        
        let sortedNums = nums.sorted()
        for k in 0..<n {
            
            // 去重
            if k > 0 && sortedNums[k] == sortedNums[k-1] {
                continue
            }
            
            let target2 = target - sortedNums[k]
            
            // 三数之和
            for i in (k+1)..<n {
                // 去重
                if i > k + 1 && sortedNums[i] == sortedNums[i-1] {
                    continue
                }
                
                var low = i + 1
                var high = n - 1
                while low < high {
                    
                    let sum = sortedNums[i] + sortedNums[low] + sortedNums[high]
                    if sum < target2 {
                        low += 1
                    }else if sum > target2 {
                        high -= 1
                    }else {
                        res.append([sortedNums[k],sortedNums[i],sortedNums[low],sortedNums[high]])
                        
                        while low < high && sortedNums[low] == sortedNums[low+1] {
                            low += 1
                        }
                        while low < high && sortedNums[high] == sortedNums[high-1] {
                            high -= 1
                        }
                        low += 1
                        high -= 1
                    }
                }
            }
        }
        
        return res
    }
}
