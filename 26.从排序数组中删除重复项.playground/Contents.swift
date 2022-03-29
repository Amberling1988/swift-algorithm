/*
给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。
 
 示例 1:
 
 给定数组 nums = [1,1,2],
 函数应该返回新的长度 2, 并且原数组 nums 的前两个元素被修改为 1, 2。
 你不需要考虑数组中超出新长度后面的元素。
 
 示例 2:
 给定 nums = [0,0,1,1,1,2,2,3,3,4],
 函数应该返回新的长度 5, 并且原数组 nums 的前五个元素被修改为 0, 1, 2, 3, 4。
 你不需要考虑数组中超出新长度后面的元素。
 
 为什么返回数值是整数，但输出的答案是数组呢?
 请注意，输入数组是以“引用”方式传递的，这意味着在函数里修改输入数组对于调用者是可见的。
 你可以想象内部操作如下:
 // nums 是以“引用”方式传递的。也就是说，不对实参做任何拷贝
 int len = removeDuplicates(nums);
 
 // 在函数里修改输入数组对于调用者是可见的。
 // 根据你的函数返回的长度, 它会打印出数组中该长度范围内的所有元素。
 for (int i = 0; i < len; i++) {
 print(nums[i]);
 }
 
 */
import Cocoa

class Solution2 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {

        if nums.count <= 1 {
            return nums.count
        }

        var i:Int = 0
        
        for j in 1..<nums.count {
            if nums[i] != nums[j] {
                i += 1
                // 换i下一位 j位的值不会变，因为换的是i+1位，i及之前的元素保证不重复
                nums[i] = nums[j]
            }
        }
        print(nums)
        return i+1
    }
    
}

// 也适合不排序数组
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        
        let n = nums.count
        if n <= 1 {
            return n
        }
        
        var temp:Int
        var i:Int = 1
        var moveCount = 0
        while i + moveCount <= n-1 {
            temp = nums[i-1]
        
            var j = i
            while j <= n-moveCount-1 {
                
                if temp == nums[j] {
                    moveCount += 1
                    nums.append(nums[j])
                    nums.remove(at: j)
                    // 交换
                    if temp != nums[j] {
                        j += 1
                    }
                }else{
                    j += 1
                }
                
            }
            i += 1
        }
        return n-moveCount
        
    }
    
}

var su = Solution2()
var array:[Int] = [0,0,1,1,1,2,2,3]
su.removeDuplicates(&array)
        


