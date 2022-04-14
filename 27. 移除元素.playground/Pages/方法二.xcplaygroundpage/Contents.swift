

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i:Int = 0
        while i <= nums.count-1 {
            if nums[i] == val {
                nums.remove(at: i)
                if nums.count == 0 {
                    return 0
                }
            }else{
                i += 1
            }
        }
        return nums.count
    }
}

let s = Solution()
var arr = [1,2,4,3,4,4,4]
s.removeElement(&arr, 4)
