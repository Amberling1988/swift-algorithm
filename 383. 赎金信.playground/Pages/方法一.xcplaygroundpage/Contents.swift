class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        
        if magazine.count < ransomNote.count {
            return false
        }

        var record = Array(repeating: 0, count: 26)
        let aAnicodeScalars = "a".unicodeScalars.first!.value
        for c in ransomNote.unicodeScalars {
            record[Int(c.value-aAnicodeScalars)] += 1
        }
        for c in magazine.unicodeScalars {
            record[Int(c.value-aAnicodeScalars)] -= 1
        }

    
        for value in record {
            if value > 0 {
                return false
            }
        }
        return true
    }
}
