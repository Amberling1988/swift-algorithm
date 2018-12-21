
// 归并排序、快速排序

import Cocoa

class Sort {
    
    
    
    /*
     归并排序
    */
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
    
    /*******************************************************************************************/
    
    /*
     快速排序
     */
    func quickSort(array:[Int]) -> [Int] {
        var a = array
        if array.count == 1 {
            return array
        }
        
        
        
        
        
        
        return a
    }
    
}

var sort = Sort()
let array = sort.mergeSort(array: [11,8,3,9,7,1,2,5])
print(array)
//sort.merge([3,8,9,11], [1,2,5,7])
