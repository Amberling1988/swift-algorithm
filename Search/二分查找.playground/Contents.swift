import Cocoa

class bSearch {
    func bSearch(array:[Int],n:Int,value:Int) -> Int {
        
        var low:Int = 0
        var high:Int = n-1
        
        
        while low <= high {
            let mid = low + (high-low)/2
            if value == array[mid] {
                return 0
            }else if value < array[mid] {
                high = mid - 1
            }else {
                low = mid + 1
            }
        }
        
        return -1
    }
}
