

import Foundation

class MyQueue {
    fileprivate var stack:[Int] = []
    fileprivate var reserveStack:[Int] = []
    
    init() {
        stack = []
        reserveStack = []
    }
    
    func push(_ x: Int) {
        if reserveStack.isEmpty {
            stack.append(x)
        }else {
            while !reserveStack.isEmpty {
                stack.append(reserveStack.popLast()!)
            }
            stack.append(x)
        }
        
    }
    
    func pop() -> Int {
        if stack.isEmpty {
            return reserveStack.removeLast()
        }
        
        while !stack.isEmpty {
            reserveStack.append(stack.popLast()!)
        }
        return reserveStack.removeLast()
        
      
    }
    
    func peek() -> Int {
       
        if stack.isEmpty {
            return reserveStack.last!
        }
        
        while !stack.isEmpty {
            reserveStack.append(stack.popLast()!)
        }
        return reserveStack.last!
    }
    
    func empty() -> Bool {
        
        return stack.isEmpty && reserveStack.isEmpty
        
    }
}
