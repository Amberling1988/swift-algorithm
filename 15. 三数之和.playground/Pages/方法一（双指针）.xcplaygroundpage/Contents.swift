/*
 15. 三数之和

给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。

注意：答案中不可以包含重复的三元组。

 

示例 1：

输入：nums = [-1,0,1,2,-1,-4]
输出：[[-1,-1,2],[-1,0,1]]
示例 2：

输入：nums = []
输出：[]
示例 3：

输入：nums = [0]
输出：[]
 

提示：

0 <= nums.length <= 3000
-105 <= nums[i] <= 105
*/

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {

        var resultArray = [[Int]]()
        let n = nums.count
        if n < 3 {
            return resultArray
        }
        
        let sortedNums = nums.sorted()
        for i in 0..<n {
            
            if sortedNums[i] > 0 {
                break
            }
            
            if i > 0 && sortedNums[i] == sortedNums[i-1] {
                continue
            }
            var low = i+1
            var high = n-1
            while low < high {
                let sum = sortedNums[i]+sortedNums[low]+sortedNums[high]
                if sum == 0 {
                    resultArray.append([sortedNums[i],sortedNums[low],sortedNums[high]])
                    
                    while low < high && sortedNums[low] == sortedNums[low+1] {
                        low += 1
                    }
                    
                    while low < high && sortedNums[high] == sortedNums[high-1] {
                        high -= 1
                    }
                    
                    low += 1
                    high -= 1
                    
                }else if sum > 0 {
                    high -= 1
                }else {
                    low += 1
                }
            }
            
        }
    
        return resultArray
    }
}
