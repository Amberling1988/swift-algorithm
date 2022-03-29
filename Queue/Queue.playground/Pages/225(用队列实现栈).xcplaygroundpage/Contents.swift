/*
请你仅使用两个队列实现一个后入先出（LIFO）的栈，并支持普通栈的全部四种操作（push、top、pop 和 empty）。

实现 MyStack 类：

void push(int x) 将元素 x 压入栈顶。
int pop() 移除并返回栈顶元素。
int top() 返回栈顶元素。
boolean empty() 如果栈是空的，返回 true ；否则，返回 false 。
 

注意：

你只能使用队列的基本操作 —— 也就是 push to back、peek/pop from front、size 和 is empty 这些操作。
你所使用的语言也许不支持队列。 你可以使用 list （列表）或者 deque（双端队列）来模拟一个队列 , 只要是标准的队列操作即可。
 

示例：

输入：
["MyStack", "push", "push", "top", "pop", "empty"]
[[], [1], [2], [], [], []]
输出：
[null, null, null, 2, 2, false]

解释：
MyStack myStack = new MyStack();
myStack.push(1);
myStack.push(2);
myStack.top(); // 返回 2
myStack.pop(); // 返回 2
myStack.empty(); // 返回 False
 

提示：

1 <= x <= 9
最多调用100 次 push、pop、top 和 empty
每次调用 pop 和 top 都保证栈不为空
 

进阶：你能否实现每种操作的均摊时间复杂度为 O(1) 的栈？换句话说，执行 n 个操作的总时间复杂度 O(n) ，尽管其中某个操作可能需要比其他操作更长的时间。你可以使用两个以上的队列
*/

public struct Queue<T> {
    fileprivate var array = [T]()
    
    var count:Int {
        return array.count
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var top : T? {
        return array.first
    }
    
    mutating func enqueue(_ element:T) {
        array.append(element)
    }
    
    mutating func dequeue()->T? {
        if isEmpty {
            return nil
        }
        
        return array.removeFirst()
    }
    
}


class MyStack {
    
    /// 保持 intputQueue 有值
    fileprivate var intputQueue:Queue<Int> = Queue()
    fileprivate var outputQueue:Queue<Int> = Queue()

    init() {

    }
    
    func push(_ x: Int) {
        
        intputQueue.enqueue(x)
        
    }
    
    func pop() -> Int {
        
        let count = intputQueue.count
        var index = 1
        while index < count {
            outputQueue.enqueue(intputQueue.dequeue()!)
            index += 1
        }
        
        let last = intputQueue.dequeue()!
        
        /// 把数据搬移到 intputQueue 中
        while !outputQueue.isEmpty {
            intputQueue.enqueue(outputQueue.dequeue()!)
        }
        return last
    }
    
    func top() -> Int {
        
        let count = intputQueue.count
        var index = 1
        var last = 0
        while !intputQueue.isEmpty {
            if index == count {
                last = intputQueue.dequeue()!
                outputQueue.enqueue(last)
            }else{
                outputQueue.enqueue(intputQueue.dequeue()!)
                index += 1
            }
        }
        
        /// 把数据搬移到 intputQueue 中
        while !outputQueue.isEmpty {
            intputQueue.enqueue(outputQueue.dequeue()!)
        }
        return last
    }
    
    func empty() -> Bool {

        return intputQueue.isEmpty
    }
}

let obj = MyStack()
obj.push(1)
obj.push(2)
obj.push(3)

let ret_3: Int = obj.top()
let ret_2: Int = obj.pop()
let ret_4: Bool = obj.empty()
