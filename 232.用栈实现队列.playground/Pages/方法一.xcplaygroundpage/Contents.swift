import Cocoa

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */

class MyQueue {
    fileprivate var stack = [Int?]()
    fileprivate var reserveStack = [Int?]()
    
    
    /** Initialize your data structure here. */
    init() {
        stack = [Int]()
        reserveStack = [Int]()
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        if reserveStack.isEmpty{
            stack.append(x)
        }else{
            // 翻转reserveStack
            while !reserveStack.isEmpty {
                stack.append(reserveStack.popLast()!)
            }
            stack.append(x)
        }
        
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        
        // 原栈为空，说明数据翻转到reserve栈中
        if stack.isEmpty{
            return reserveStack.removeLast()!
        }
        
        // 翻转stack
        while !stack.isEmpty {
            reserveStack.append(stack.removeLast())
        }
        
        return reserveStack.removeLast()!
    }
    
    /** Get the front element. */
    func peek() -> Int {
       
        // 原栈为空，说明数据翻转到reserve栈中
        if stack.isEmpty{
            return reserveStack.last!!
        }
        
        // 翻转stack
        while !stack.isEmpty {
            reserveStack.append(stack.removeLast()!)
        }
        
        return reserveStack.last!!
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        
        if stack.isEmpty && reserveStack.isEmpty {
            return true
        }
        
        return false
    }
}


