//: [Previous](@previous)

import Cocoa

public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
        self.val = val
        self.next = nil
      
    }
}

class Solution {
    // 添加结果翻转
    func addTwoNumbers(_ l1:ListNode?, _ l2:ListNode?) -> ListNode? {
        
        var p1 = l1
        var p2 = l2
        
        var curNode:ListNode?
        let sumHead = ListNode(0)
        
        var carry = 0
        while p1 != nil || p2 != nil {
            
            let v1 = p1?.val ?? 0
            let v2 = p2?.val ?? 0
            let sum = v1 + v2 + carry
            
            curNode = ListNode(sum % 10)
            carry = sum / 10
            
            curNode?.next = sumHead.next
            sumHead.next = curNode

            
            p1 = p1?.next
            p2 = p2?.next
        }
        
        
        if carry == 1 {
            curNode = ListNode(1)
            curNode?.next = sumHead.next
            sumHead.next = curNode
        }
        
        return sumHead.next
    }
}
