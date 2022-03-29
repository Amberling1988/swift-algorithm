/*
 383. 赎金信

 给你两个字符串：ransomNote 和 magazine ，判断 ransomNote 能不能由 magazine 里面的字符构成。

 如果可以，返回 true ；否则返回 false 。

 magazine 中的每个字符只能在 ransomNote 中使用一次。

  

 示例 1：

 输入：ransomNote = "a", magazine = "b"
 输出：false
 示例 2：

 输入：ransomNote = "aa", magazine = "ab"
 输出：false
 示例 3：

 输入：ransomNote = "aa", magazine = "aab"
 输出：true
  

 提示：

 1 <= ransomNote.length, magazine.length <= 105
 ransomNote 和 magazine 由小写英文字母组成
 */

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var record = Array(repeating: 0, count: 26);
        let aUnicodeScalarValue = "a".unicodeScalars.first!.value
        for unicodeScalar in magazine.unicodeScalars {
            // 通过record 记录 magazine 里各个字符出现的次数
            let idx: Int = Int(unicodeScalar.value - aUnicodeScalarValue)
            record[idx] += 1
        }
        for unicodeScalar in ransomNote.unicodeScalars {
            // 遍历 ransomNote,在record里对应的字符个数做 -- 操作
            let idx: Int = Int(unicodeScalar.value - aUnicodeScalarValue)
            record[idx] -= 1
            // 如果小于零说明在magazine没有
            if record[idx] < 0 {
                return false
            }
        }
        return true
    }
}
