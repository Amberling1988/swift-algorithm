
// 归并排序、快速排序

import Cocoa

class Sort {
    
    
    
    /****************************************** 归 并 排 序 *************************************************/
    func merge(_ array1:[Int], _ array2:[Int])->[Int]{
        
        var a = [Int]()
        let m = array1.count
        let n = array2.count
        
        var i:Int = 0
        var j:Int = 0
        
        while i<m && j<n {
            if array1[i] <= array2[j] {
                a.append(array1[i])
                i += 1
            }else{
                a.append(array2[j])
                j += 1
            }
        }
        
        if i == m {
            a += array2[j..<n]
        }else{
            a += array1[i..<m]
        }
        return a
    }
    
    private func mergeSortC(_ array:[Int]) -> [Int]{
        if array.count <= 1 {
            print("count = 1,array:\(array)")
            
            return array
        }
        print(array)
        let tmpArray = array
        let n = array.count
        let q = (0+n-1)/2
        
        let leftArray = mergeSortC(Array(tmpArray[0...q]))
        let rightArray = mergeSortC(Array(tmpArray[q+1...n-1]))
        
        
        return merge(leftArray,rightArray)

    }
    public func mergeSort(array:[Int]) -> [Int] {
        
        let b:[Int] = mergeSortC(array)
        print("b:\(b)")
        return b
    }
    
    /****************************************** 快 速 排 序 *************************************************/

    /*
     * array：传入参数的数组，注意是传址不是传值
     * p:排序区间起点下标
     * r:排序区间终点点下标
     */
    private func partition(_ array:inout [Int], _ p:Int, _ r:Int) -> Int {
        
        let pivot = array[r] // 分界值，一般选数组排序区间末尾元素
        
        var i:Int = p
        for j in p...r-1 {
            
            if array[j] < pivot{
                
                let tmp = array[i];
                array[i] = array[j]
                array[j] = tmp
                
                i += 1 // 有小于pivot的数字i++
            }
        }
        
        // 交换 a[i] 与 a[r] 即：将pivot放到相应位置
        array[r] = array[i]
        array[i] = pivot
        
        return i //获取区分点排序下标
    }
    
    /* array：传入参数的数组，注意是传址不是传值
     * p:排序区间起点下标
     * r:排序区间终点点下标
     */
    private func qucikSortC (_ array:inout [Int], _ p:Int, _ r:Int) -> [Int]{
        // 需要排序的区间只包含一个数字，则不需要重排数组，直接返回
        if p >= r {
            return array
        }
       
        let i = partition(&array, p, r)

        qucikSortC(&array, p, i-1)
        qucikSortC(&array, i+1, r)
      
        return array
    }
    
    public func quickSort(_ array: [Int]) -> [Int] {
        var a = array
        return  qucikSortC(&a, 0, array.count-1)
    }
    
}

var sort = Sort()
let result = sort.quickSort([6,11,3,9,8,12,0])
print(result)

