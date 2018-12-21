

// 冒泡、插入、选择 排序
import Cocoa


class Sort {
    
    /* 选择排序
     array：排序数组
     */
    
    func selectionSort (array:[Int]) -> [Int] {
        let n = array.count
        if n == 1 {
            return array
        }
        
        var a:[Int] = array
        
        for i in 0..<n-1 {
            
            var minIndex : Int = i
            var j = i+1
            
            while j<n {
                if a[j]<a[minIndex] {
                    minIndex = j
                }
                j += 1
            }
            if minIndex != i {
                let tmp = a[i]
                a[i] = a[minIndex]
                a[minIndex] = tmp
            }
            
        }
        return a
    }
    
    
    
    /* 插入排序
     array：排序数组
     */
    func insertSort (array:[Int]) -> [Int] {
        let n = array.count
        if n == 1 {
            return array
        }
        
        var a:[Int] = array
        for i in 1..<n {
            let value = a[i]
            
            var j:Int = i-1
            while j>=0 {
                if a[j]>value {
                    a[j+1] = a[j] //后移一位
                }else {
                    break
                }
                
                j -= 1
            }
            a[j+1] = value
            
        }

        return a
    }
    
    
    /* 冒泡排序
     array：排序数组
     */
    func bubbleSort (array:[Int]) -> [Int] {
        let n = array.count
        if n == 1 {
            return array
        }
        
        var a:[Int] = array
        for i in 0..<n {
            var isSwap :Bool = false
            for j in 0..<n-i-1 {
                if a[j]>a[j+1] {
                    let temp = a[j]
                    a[j] = a[j+1]
                    a[j+1] = temp
                    
                    isSwap = true
                }
                
            }
            if !isSwap {
                break
            }
        }
        return a
    }

}

var sort = Sort()
var array = sort.selectionSort(array: [4,5,6,1,2,7,3])
print(array)
