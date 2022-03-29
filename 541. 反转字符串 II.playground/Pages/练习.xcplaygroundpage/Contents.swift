class Solution {
    func reverseStr(_ s: String, _ k: Int) -> String {
        /// 转为数组
        var sArr = Array(s)
        
        for i in stride(from: 0, to: s.count-1, by: 2*k){
            var left = i
            
            /// 处理越界、处理 k > s.count
            var right = min(s.count-1, left + k - 1)
            
            while left < right {
                (sArr[left],sArr[right]) = (sArr[right],sArr[left])
                
                left += 1
                right -= 1
            }
        }
        
        return String(sArr)
    }
}

let s = Solution()
s.reverseStr("abcdefg", 2)
