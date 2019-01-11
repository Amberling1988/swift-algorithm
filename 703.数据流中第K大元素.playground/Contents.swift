
/*
设计一个找到数据流中第K大元素的类（class）。注意是排序后的第K大元素，不是第K个不同的元素。

你的 KthLargest 类需要一个同时接收整数 k 和整数数组nums 的构造器，它包含数据流中的初始元素。每次调用 KthLargest.add，返回当前数据流中第K大的元素。

示例:
int k = 3;
int[] arr = [4,5,8,2];
KthLargest kthLargest = new KthLargest(3, arr);
kthLargest.add(3);   // returns 4
kthLargest.add(5);   // returns 5
kthLargest.add(10);  // returns 5
kthLargest.add(9);   // returns 8
kthLargest.add(4);   // returns 8
 
说明:
你可以假设 nums 的长度≥ k-1 且k ≥ 1。
*/

import Cocoa
class KthLargest3 {
    
    fileprivate var array :[Int]
    fileprivate var k :Int
    
    init(_ k: Int, _ nums: [Int]) {
        array = nums
        self.k = k
        
        if array.count >= k {
            array.sort(by: >)
            array = Array(array[0...k-1])
        }
        
    }
    
    func add(_ val: Int) -> Int {
        
        if array.count < k-1 {
            
            array.append(val)
            return 0
            
        }else if array.count == k-1{
            
            array.append(val)
            array = array.sorted(by: >)
    
            return array[k-1]
        }
        
        if val >= array[0] {
            
            array.insert(val, at: 0)
            array.removeLast()
            
        }else if val < array[k-1] {
            // 啥也不做
        }else {
            
            for i in 0...k-1 {
                if array[i] <= val {
                    array.insert(val, at: i)
                    array.removeLast()
                    break
                }
            }
        }
        
        return array[k-1]
    }
}

class KthLargest2 {
    
    fileprivate var array :[Int]
    fileprivate var k :Int
    
    private func partition (_ p:Int, _ r:Int) -> Int {
        
        let pivot = array[r]
        
        var i = p
        for j in p...r-1 {
            if array[j] >= pivot {
                
                array.swapAt(i, j)
                
                i += 1
            }
        }
        
        array[r] = array[i]
        array[i] = pivot
        
        return i
        
    }
    
    private func sort(p:Int, r:Int){
        
        if p >= r {
            return
        }
        
        
        let i = partition(p, r)
        
        if k-1 > i {
            //sort(p: 0, r: i-1)
            sort(p: i+1, r: r)
        }else if i == k-1{
            array = Array(array[0...i])// 抛弃下标 >i 的所有元素
            sort(p: p, r: i-1)
        }else{
            sort(p: p, r: i-1)
        }
    }
    
    init(_ k: Int, _ nums: [Int]) {
        array = nums
        self.k = k
        
        if array.count >= k {
            sort(p:0, r: array.count-1)
            print("init \(array)")
        }
    }
    
    func add(_ val: Int) -> Int {
       
        if array.count < k-1 {
            array.append(val)
            return 0
        }else if array.count == k-1 {
            array.append(val)
            sort(p:0, r: array.count-1)
            return array[k-1]
        }
        
        guard val > array[k-1] else {
            print(array[k-1])
            return array[k-1]
        }
        array.append(val)
        sort(p:0, r: array.count-1)
        print(array)
        return array[k-1]
        
    }
}

class KthLargest1 {
    
    fileprivate var array :[Int]
    fileprivate var k :Int
    
    private func partition (_ p:Int, _ r:Int) -> Int {
        
        let pivot = array[r]
        
        var i = p
        for j in p...r-1 {
            if array[j] >= pivot {
                
                let tmp = array[i]
                array[i] = array[j]
                array[j] = tmp
                
                i += 1
            }
        }
        
        array[r] = array[i]
        array[i] = pivot
        
        return i
        
    }
    
    private func sort(p:Int, r:Int){
        
        if p >= r {
            return
        }
        
    
        let i = partition(p, r)
        sort(p: 0, r: i-1)
        sort(p: i+1, r: r)
        
    }
    
    init(_ k: Int, _ nums: [Int]) {
        array = nums
        self.k = k
        
        if array.count >= k {
            sort(p:0, r: array.count-1)
        }
    }
    
    func add(_ val: Int) -> Int {
        
        
        if array.count < k-1 {
            print(array)
            array.append(val)
            return 0
            
        }else if array.count == k-1 {
            print(array)
            array.append(val)
            sort(p:0, r: array.count-1)
            
            return array[k-1]
            
        }
        
        if val >= array.first! {
            array.insert(val, at: 0)
        }else if val <= array.last! {
            array.append(val)
        }else {
            for i in 0...array.count-1 {
                if array[i] <= val {
                    array.insert(val, at: i)
                    break
                }
            }
        }
        print(array)
        return array[k-1]
    }
}

var kthLargest = KthLargest(3, [5,-1])
kthLargest.add(2)
kthLargest.add(1)
kthLargest.add(-1)
kthLargest.add(3)
kthLargest.add(4)
