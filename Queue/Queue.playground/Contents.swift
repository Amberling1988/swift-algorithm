import Cocoa

public struct QueueWithArray<T> {
    fileprivate var array = [T?]()
    fileprivate var capacity = 0
    fileprivate var head = 0
    fileprivate var tail = 0
    
    var isEmpty : Bool {
        return size == 0
    }
    
    var size : Int {
        return tail - head
    }
    
    var peek : T? {
        if isEmpty {
            return nil
        }
        return array[head]
    }
    
    
    init(defaultElement:T,capacity:Int) {
        self.capacity = capacity
        
        array = [T](repeating: defaultElement, count: capacity)
    }
    mutating func enqueue(element:T) -> Bool{
        if tail == capacity {
            if head == 0{
                return false
            }
            
            for i in head..<tail {
                array[i-head] = array[i]
                
                tail -= head
                head = 0
            }
            
        }
        
        array[tail] = element
        tail += 1
        
        return true
        
    }
    mutating func dequeue() -> T?{
        if isEmpty {
            return nil
        }
        
        let element = array[head]
        head += 1
        
        return element
    }

}

// 为避免数据迁移，
public struct Queue2<T> {
    fileprivate var array = [T?]()
    // 数组最大长度
    fileprivate var capacity = 0
    // 队头下标
    fileprivate var head = 0
    // 队尾下标
    fileprivate var tail = 0
    
    var size:Int {
        return tail - head
    }
    
    var isEmpty: Bool {
        return  size == 0
    }
    
    var peek: T? {
        if isEmpty {
            return nil
        }
        return array[head]
    }
    
    init(defaultElement:T,capacity:Int) {
        self.capacity = capacity
        
        array = [T](repeating: defaultElement, count: capacity)
    }
    
    mutating func enqueue(_ element:T) ->Bool {
        if tail == capacity {
            if head == 0 {
                return false
            }
            
            for i in head..<tail {
                array[i-head] = array[i]
            }
            // 更新 head tail
            tail -= head
            head = 0
        }
        
        array[tail] = element
        tail += 1
        
        return true
    }
    
    mutating func dequeue()->T? {
        
        if isEmpty{
            return nil
        }
        
        let element = array[head]
        head += 1
        
        return element // 没有进行删除操作,只是head+1
    }
    
}

 // 数组实现（最简单情况,不考虑数据迁移）
public struct Queue1<T> {
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

