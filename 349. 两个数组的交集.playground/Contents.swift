
/// unordered_set 数据结构
class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        var set1 = Set<Int>()
        var set2 = Set<Int>()
        
        for num in nums1 {
            set1.insert(num)
        }
        
        for num in nums2 {
            if set1.contains(num){
                set2.insert(num)
            }
        }
        
        return Array(set2)
    }
    
}

let s = Solution()
s.intersection([1,3,4,3,2], [2,3,4,5,1,2])
