/*
给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
注意：答案中不可以包含重复的三元组。

例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
满足要求的三元组集合为：
[
[-1, 0, 1],
[-1, -1, 2]
]
*/
import Cocoa

class Solution1 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        var resultArray = [[Int]]()
        let n:Int = nums.count
        if n<3 {
            return resultArray
        }
        var a:[Int] = nums.sorted()// O(nlogn)
        
        
        for i in 0...n-3 {
            // 减少循环次数
            if a[i] > 0 {
                break
            }
            
            // 避免重复
            if i>=1 && a[i] == a[i-1] {
                continue
            }
            var low:Int = i+1
            var high:Int = n-1
            while low < high {
                if a[i]+a[low]+a[high] == 0 {
                    resultArray.append([a[i],a[low],a[high]])
                    while low < high && a[low] == a[low+1] {
                        low += 1
                    }
                    while low < high && a[high] == a[high-1] {
                        high -= 1
                    }
                    low += 1
                    high -= 1
                }else if a[i]+a[low]+a[high] > 0{
                    high -= 1
                }else {
                    low += 1
                }
            }
        }
        
        
        return resultArray
    }
}

var so = Solution1()
so.threeSum([-2,0,1,1,2])

