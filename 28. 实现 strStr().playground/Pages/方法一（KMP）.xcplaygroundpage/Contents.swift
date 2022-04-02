
import Foundation
/*
实现 strStr() 函数。

给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串出现的第一个位置（下标从 0 开始）。如果不存在，则返回  -1 。

说明：
当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。
对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与 C 语言的 strstr() 以及 Java 的 indexOf() 定义相符。
 示例 1：
 输入：haystack = "hello", needle = "ll"
 输出：2
 
 示例 2：
 输入：haystack = "aaaaa", needle = "bba"
 输出：-1
 
 示例 3：
 输入：haystack = "", needle = ""
 输出：0

 提示：
 0 <= haystack.length, needle.length <= 5 * 104
 haystack 和 needle 仅由小写英文字符组成
*/

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        if needle.count == 0 {
            return 0
        }
        if haystack.count == 0 || haystack.count < needle.count {
            return -1
        }
        
        let hArr = Array(haystack)
        let nArr = Array(needle)
        return getIndex(0, hArr, nArr)

    }
    
    
    func getIndex(_ preIndex:Int, _ hArray:[Character],_ nArray:[Character]) -> Int {

        if let j = hArray.firstIndex(of: nArray[0]) {
     
            let tmpArr:[Character] = Array(hArray.suffix(from: j))

            if tmpArr.prefix(nArray.count) == nArray.prefix(upTo: nArray.count) {
                return j+preIndex
            }else {
                return getIndex(j+1+preIndex, Array(hArray.suffix(from: j+1)), nArray)
            }
        }else {
            return -1
        }
    }
}

let s = Solution()
s.strStr("helololol", "lo")
