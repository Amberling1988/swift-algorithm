

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        
        //       1 -> 2 -> 3 -> 4 -> 5 -> nil
        // nil<- 1 <- 2<- 3 <- 4 <- 5
        var preNode:ListNode?, curNode:ListNode? , resHead:ListNode?
        curNode = head
        
        while curNode != nil {
          
            let nextNode = curNode?.next
            
            if nextNode == nil {
                resHead = curNode
            }
            curNode?.next = preNode
            preNode = curNode
            curNode = nextNode
        }
        return resHead
    }
    
}
