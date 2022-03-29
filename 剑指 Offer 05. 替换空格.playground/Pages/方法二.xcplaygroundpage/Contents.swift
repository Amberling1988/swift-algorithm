class Solution {
    func replaceSpace(_ s: String) -> String {

        let sArr = Array(s)
        
        if sArr.count == 0 {
            return ""
        }
        var resArr = [Character]()
        
        for i in 0...sArr.count-1 {
            if sArr[i] == " " {
                resArr.append("%")
                resArr.append("2")
                resArr.append("0")
            }else{
                resArr.append(sArr[i])
            }
        }
        
        return String(resArr)
    }
}

let s = Solution()
s.replaceSpace("abc def ")
