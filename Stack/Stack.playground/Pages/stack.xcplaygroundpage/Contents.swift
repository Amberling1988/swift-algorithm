import Cocoa

public struct Stack<T>{
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
