class Solution {
    func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
        
        var sumDic = [Int:Int]()
        for a in nums1 {
            for b in nums2{
                let key = a + b
                sumDic[key] = sumDic[key,default: 0] + 1
            }
        }
        
        var result = 0
        for c in nums3 {
            for d in nums4 {
                let key = -(c + d)
                
                result += sumDic[key, default: 0]
            }
        }
        return result
    }
}

let s = Solution()
s.fourSumCount([1,-1], [2,-2], [0,1], [2,3])
