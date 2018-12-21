import Cocoa



class Solution {
    struct Stack<T>{
        fileprivate var array = [T]()
        
        var count:Int {
            return array.count
        }
        
        var isEmpty: Bool {
            return array.isEmpty
        }
        
        var top : T? {
            return array.last
        }
        
        
        mutating func push(newElement:T) {
            
            array.append(newElement)
            
        }
        
        mutating func pop() -> T? {
            if isEmpty {
                return nil
            }
            return array.popLast()
        }
    }
    func isValid(_ s: String) -> Bool {
        if s.isEmpty {
            return true
        }
        
        let mapping:[Character:Character] = [ "(": ")", "{":"}", "[":"]" ]
        var stack = Stack<Character>()
        
        for character in s {
            
            if mapping.keys.contains(character) {
                stack.push(newElement: character)
            }else {
                guard let lastStr = stack.top, character == mapping[lastStr]  else {
                    return false
                }
                
                stack.pop()
            }
        }
        
        return stack.isEmpty
    }
}
