class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        if needle.count == 0 {
            return 0
        }
        if haystack.count < needle.count {
            return -1
        }
        

        var hStr = haystack

        for i in 0...hStr.count-needle.count {
            if hStr.hasPrefix(needle) {
                return i
            }else {
                hStr.remove(at: hStr.startIndex)
            }
        }
        return -1

    }

}

let s = Solution()
s.strStr("helolololl", "ll")
