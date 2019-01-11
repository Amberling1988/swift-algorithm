import Cocoa

class Solution {
    
    private func partition (_ nums:inout [Int], _ p:Int, _ r:Int) -> Int {
        
        let pivot = nums[r]
        
        var i = p
        for j in p...r-1 {
            if nums[j] >= pivot {
                let tmp = nums[i]
                nums[i] = nums[j]
                nums[j] = tmp

                i += 1
            }
        }
        
        nums[r] = nums[i]
        nums[i] = pivot
        
        
        return i
    }
    
    private func quickSort (_ nums:inout [Int],_ k:Int, _ p:Int, _ r:Int) -> [Int]{
        if p >= r {
            return nums
        }
        
        let i = partition(&nums, p, r)
        if k-1 > i {
            quickSort(&nums,k, i+1, r)
        }else if k-1 == i {
            return nums
        }else {
            nums = Array(nums[0...i-1])
            quickSort(&nums, k, 0, i-1)
        }
        
        return nums
        
    }
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        nums.sorted()[k-1]
        var array = nums
        let result:[Int] =  quickSort(&array, k, 0, nums.count-1)

        return result[k-1]

    }
    
}

var solution = Solution()
let result = solution.findKthLargest([2,5,7,1,0,4,9], 3)
print("result \(result)")
