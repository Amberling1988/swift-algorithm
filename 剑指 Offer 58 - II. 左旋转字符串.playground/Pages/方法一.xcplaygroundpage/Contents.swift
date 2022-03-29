/*
 剑指 Offer 58 - II. 左旋转字符串
 
 字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。请定义一个函数实现字符串左旋转操作的功能。比如，输入字符串"abcdefg"和数字2，该函数将返回左旋转两位得到的结果"cdefgab"。

 示例 1：
 输入: s = "abcdefg", k = 2
 输出: "cdefgab"
 
 示例 2：
 输入: s = "lrloseumgh", k = 6
 输出: "umghlrlose"
 
 限制：
 1 <= k < s.length <= 10000
 */

class Solution {
    
    func reverseString(_ sArr: inout [Character], _ startIndex:Int, _ endIndex:Int) {

        var left = startIndex
        var right = endIndex - 1
        while left < right {
            (sArr[left],sArr[right]) = (sArr[right],sArr[left])
            
            left += 1
            right -= 1
        }
    }
    
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        
        var sArr = Array(s)
        let len = sArr.count
        // 翻转 0-n
        reverseString(&sArr, 0, n)
        // 翻转 n-len
        reverseString(&sArr, n, len)
        // 翻转 0-len
        reverseString(&sArr, 0, len)

        return String(sArr)
    }
}
         
let s = Solution()
s.reverseLeftWords("abcdefg", 2)
              
