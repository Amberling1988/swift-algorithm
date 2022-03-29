
class Solution {
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        
        let sArr = Array(s)
        let s1 = String(sArr.suffix(from: n))
        let s2 = String(sArr.prefix(upTo: n))

        return s1 + s2
    }
}
         
let s = Solution()
s.reverseLeftWords("abcdefg", 2)
              

