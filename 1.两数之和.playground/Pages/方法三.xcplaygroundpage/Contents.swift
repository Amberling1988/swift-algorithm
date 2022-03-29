

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var map = [Int:Int]()
        
        for (index,value) in nums.enumerated() {
            
            if let v = map[target-value] {
                return [v,index]
            }else {
                map[value] = index
            }
        }
        return []
    }
}


let s = Solution()
s.twoSum([1,2,3,5,8,4],5)


