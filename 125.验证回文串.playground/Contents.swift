import Cocoa

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        
        if s.isEmpty {
            return true
        }
        
        // 过滤 s
        var pureS = String()
        for character in s{
            if ( character >= "0" && character <= "9" )
                || ( character >= "a" && character <= "z" )
            || ( character >= "A" && character <= "Z" ){
                pureS.append(character)
            }
        }
        
        var newS = pureS
        for character in pureS {
        
            let lastStr = newS.removeLast()
            if character != lastStr {
                return false
            }
        }
        
        if newS.isEmpty {
            return true
        }
        
        return false
    }
}
/* 最省时答案
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        if s.count == 0 {
            return true
        }
        
        var chas = s.cString(using:.ascii)!
        
        var left = 0
        var right = s.count - 1
        
        var loop = true
        
        while loop {
            if left > right {
                loop = false
                break
            }
            
            let leftChar = chas[left]
            
            if !checkIsNormalChar(leftChar) {
                left = left + 1
                continue
            }
            
            let rightChar = chas[right]
            
            if !checkIsNormalChar(rightChar) {
                right = right - 1
                continue
            }
            
            if isEqual(leftChar,rightChar) {
                left = left + 1
                right = right - 1
            } else {
                return false
            }
            
        }
        return true
    }
    
    func isEqual(_ c:CChar, _ other:CChar) -> Bool {
        if c == other {
            return true
        }
        var newC = c
        if c >= 97 {
            newC = c - 32;
        }
        
        var newOther = other
        
        if other >= 97 {
            newOther = other - 32
        }
        
        return newC == newOther
    }
    
    func checkIsNormalChar(_ c: CChar) -> Bool {
        if c < 48 {
            return false
        }
        
        if c > 122 {
            return false
        }
        
        if c > 57 && c < 65 {
            return false
        }
        
        if c > 90 && c < 97 {
            return false
        }
        
        return true
    }
}
 */
/*
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        
        if s.isEmpty {
            return true
        }
        
        // 过滤 s
        var pureS = String()
        var newS = String()
        for character in s.lowercased(){
            if ( character >= "a" && character <= "z" ) || ( character >= "0" && character <= "9" ){
                pureS.append(character)
                newS.insert(character, at: newS.startIndex)
            }
        }
        print(pureS)
        print(newS)
        if pureS == newS {
            return true
        }
        
        return false
    }
}
 */
