import Cocoa
/*
请判断一个链表是否为回文链表。

示例 1:
输入: 1->2
输出: false

示例 2:
输入: 1->2->2->1
输出: true
 
进阶：
你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？
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
    func isPalindrome(_ head: ListNode?) -> Bool {
        var curNode:ListNode?
        var reverseHead:ListNode?,reversePreNode:ListNode?,reverseCurNode:ListNode?

        if head == nil || head?.next == nil{
            return true
        }
        
        // 反转链表
        reverseCurNode = head
        while reverseCurNode != nil {
            
            let reverseNextNode = reverseCurNode!.next
            if reverseNextNode == nil {
                reverseHead = reverseCurNode
            }
            reverseCurNode!.next = reversePreNode
            reversePreNode = reverseCurNode
            reverseCurNode = reverseNextNode
        }
        
        // 遍历两个链表
        curNode = head
        reverseCurNode = reverseHead
      
        while  (curNode != nil) && (reverseCurNode != nil)  {
            
            guard curNode!.val == reverseCurNode!.val else {
                return false
            }
            // 下移节点
            reverseCurNode?.val = reverseCurNode?.next?.val ?? 0
            reverseCurNode = reverseCurNode?.next
            
            curNode?.val = curNode?.next?.val ?? 0
            curNode = curNode?.next
            
           
        }
        return true
    }
}


class Solution2 {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil{
            return true
        }
        
        var curNode:ListNode?
        var array = [Int]()
        
        // 遍历链表
        curNode = head
        while curNode != nil {
            array.append(curNode!.val)
            curNode = curNode?.next
        }
        
        var left:Int = 0
        var right:Int = array.count-1
        while left < right {
            guard array[left] == array[right] else{
                return false
            }
            
            left += 1
            right -= 1
        }
        
        return true
    }
}

