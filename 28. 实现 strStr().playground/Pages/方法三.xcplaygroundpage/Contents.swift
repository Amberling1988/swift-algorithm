class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        if needle.count == 0 {
            return 0
        }
        if haystack.count < needle.count {
            return -1
        }
        

        var hStr = haystack
        var space = 0

        for i in 0...hStr.count-needle.count {
            if hStr.hasPrefix(needle) {
                return i + space
            }else {
                hStr.remove(at: hStr.startIndex)
                if let index = hStr.firstIndex(of: needle.first!) {
                    space += hStr.distance(from: hStr.startIndex, to: index)
                    hStr.removeFirst(hStr.distance(from: hStr.startIndex, to: index))
                    print(hStr)
                }else {
                    break
                }
                
            }
        }
        return -1

    }

}

let s = Solution()
s.strStr("helolololl", "ll")
