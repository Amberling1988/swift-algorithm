/*
 请你仅使用两个栈实现先入先出队列。队列应当支持一般队列支持的所有操作（push、pop、peek、empty）：

实现 MyQueue 类：

void push(int x) 将元素 x 推到队列的末尾
int pop() 从队列的开头移除并返回元素
int peek() 返回队列开头的元素
boolean empty() 如果队列为空，返回 true ；否则，返回 false
 

说明：

你只能使用标准的栈操作 —— 也就是只有 push to top, peek/pop from top, size, 和 is empty 操作是合法的。
你所使用的语言也许不支持栈。你可以使用 list 或者 deque（双端队列）来模拟一个栈，只要是标准的栈操作即可。
 

进阶：

你能否实现每个操作均摊时间复杂度为 O(1) 的队列？换句话说，执行 n 个操作的总时间复杂度为 O(n) ，即使其中一个操作可能花费较长时间。
*/

import Foundation

class MyQueue {
    
    /// 输入栈
    fileprivate var inputStack:[Int] = []
    /// 输出栈
    fileprivate var outputStack:[Int] = []
    
    init(){
        
    }
    
    func push(_ x:Int) {

//        while !outputStack.isEmpty {
//            inputStack.append(outputStack.popLast()!)
//        }
    
        inputStack.append(x)
        
    }
    
    func pop() -> Int {
        if outputStack.isEmpty {
            while !inputStack.isEmpty {
                outputStack.append(inputStack.popLast()!)
            }
        }
        
        let item = outputStack.popLast()!
        
        return item
    }
    
    func peek() -> Int {
        
        if outputStack.isEmpty {
            while !inputStack.isEmpty {
                outputStack.append(inputStack.popLast()!)
            }
        }
        
        return outputStack.last!
        
    }
    
    func empty() -> Bool {
        
        return inputStack.isEmpty && outputStack.isEmpty
    }
  
}

var q = MyQueue()
q.push(1)
q.push(2)
q.push(3)
q.pop()
q.peek()
q.empty()
q.push(4)
