
import Cocoa

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        //1,先转成数组
        //2,数组（滑动窗口）
        //3,记录数组最大长度
        if s.count <= 1  {
            return s.count
        }
        let sArr = Array(s)
        var winArr:[Character] = []
        var count = 0
        
        for (i,item) in sArr.enumerated() {
            if winArr.contains(item) {
                let index:Int = winArr.firstIndex(of: item) ?? 0
                winArr.removeFirst(index+1)
                print(index)
            }
            winArr.append(sArr[i])
            count = max(winArr.count, count)
        }
        return count
    }
}

let s = Solution()
s.lengthOfLongestSubstring("aamabcbeerq")
