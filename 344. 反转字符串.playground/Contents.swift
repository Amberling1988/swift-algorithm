/*
 344. 反转字符串

 编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 s 的形式给出。

 不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。

 示例 1：
 输入：s = ["h","e","l","l","o"]
 输出：["o","l","l","e","h"]
 
 示例 2：
 输入：s = ["H","a","n","n","a","h"]
 输出：["h","a","n","n","a","H"]
  

 提示：

 1 <= s.length <= 105
 s[i] 都是 ASCII 码表中的可打印字符
 */

class Solution {
    // 双指针 - 元组
    func reverseString(_ s: inout [Character]) {
        
        // 双指针
        var low = 0
        var high = s.count - 1
        
        while low < high {
            (s[low],s[high]) = (s[high],s[low])
            low += 1
            high -= 1
        }
        print(s)
        // 某些用例无法通过
//        let n = s.count-1
//        for i in 0..<n/2 {
//            s.swapAt(i, n-i)
//        }
//        print(s)
}

}

let s = Solution()
var arr:[Character] = ["h","e","l","l","o"]
s.reverseString(&arr)
print(arr)
