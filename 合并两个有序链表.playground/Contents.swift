import Cocoa

/*
将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

示例：

输入：1->2->4, 1->3->4
输出：1->1->2->3->4->4
*/


//Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
      self.val = val
      self.next = nil
  }
}

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var curNode:ListNode?,curNode1:ListNode?,curNode2:ListNode?
        curNode1 = l1; curNode2 = l2
        
        // 初始化哑节点，并赋值next
        let dummyNode = ListNode(0)
        curNode = dummyNode
        while (curNode1 != nil) && (curNode2 != nil) {
            
            let val1 = curNode1!.val
            let val2 = curNode2!.val
            
            if  val1 < val2{
                curNode?.next = curNode1
                curNode1 = curNode1?.next
                curNode = curNode?.next
            }else if val1 > val2{
                curNode?.next = curNode2
                curNode2 = curNode2?.next
                curNode = curNode?.next
            }else{
                curNode?.next = curNode1
                curNode1 = curNode1?.next
                
                curNode?.next?.next = curNode2
                curNode2 = curNode2?.next
                
                curNode = curNode?.next?.next  //curNode 下移两个节点
            }
            
        }
        if curNode1 == nil {
            curNode?.next = curNode2
        }else {
            curNode?.next = curNode1
        }
        
        return dummyNode.next;
    }
}
