import Cocoa

/* 题目
给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

示例：

输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
输出：7 -> 0 -> 8
原因：342 + 465 = 807
*/

/**
 * Definition for singly-linked list.
 */
public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
        self.val = val
        self.next = nil
      
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var addCurNode:ListNode?, curNode1:ListNode?, curNode2:ListNode?
        
        curNode1 = l1; curNode2 = l2
        
        var carry : Int = 0
        
        let addHead = ListNode(0)
        addCurNode = addHead
        
        while (curNode1 != nil) || (curNode2 != nil) {
            
            let varl = curNode1?.val ?? 0
            let var2 = curNode2?.val ?? 0
            let sum = varl + var2 + carry
            carry = sum / 10
            
            addCurNode?.next = ListNode(sum % 10)
            
            // 下移节点
            addCurNode = addCurNode?.next
            curNode1 = curNode1?.next
            curNode2 = curNode2?.next
            
        }
        
        if carry > 0 {
            addCurNode?.next = ListNode(carry)
        }        
        
        return addHead.next
    }
    
}


/*
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var addCurNode:ListNode?, curNode1:ListNode?, curNode2:ListNode?
        curNode1 = l1
        curNode2 = l2
        
        var carry:Int = 0 // 进位值
        
        // 新建 head节点
        var addHead = ListNode(0)
        addCurNode = addHead
        
        while (curNode1 != nil) || (curNode2 != nil)  {
            
            let val1 = curNode1?.val ?? 0
            let val2 = curNode2?.val ?? 0
            let sum = val1 + val2 + carry
            carry = sum / 10
            
            addCurNode?.next = ListNode(sum % 10)
            
            addCurNode = addCurNode?.next
            curNode1 = curNode1?.next
            curNode2 = curNode2?.next

        }
        if carry > 0 {
            addCurNode?.next = ListNode(carry)
        }
        
        return addHead.next
        
    }

}
 */
