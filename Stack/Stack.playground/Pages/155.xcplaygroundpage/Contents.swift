//: [Previous](@previous)

/// 提示：
/// pop、top 和 getMin 操作总是在 非空栈 上调用。
import Foundation

class MinStack {

    fileprivate var stack:[Int] = []
    fileprivate var minStack:[Int] = [Int.max]
    
    init() {
        
    }
    
    func push(_ val: Int) {
        stack.append(val)
        minStack.append(min(val, minStack.last!))
    }
    
    func pop() {
        stack.popLast()
        minStack.popLast()
    }
    
    func top() -> Int {
        stack.last!
    }
    
    func getMin() -> Int {

        return minStack.last!
    }
}


