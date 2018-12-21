import Cocoa


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
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        var reverseHead:ListNode? ,curNode:ListNode?,preNode:ListNode?// 声明
        curNode = head;
        
        while curNode != nil {//不是空链表
            
            let nextNode = curNode!.next; // 储存curNode!.next
            // 核心
            if nextNode == nil {
                reverseHead = curNode;
            }
            
            curNode!.next = preNode;
            preNode = curNode;
            curNode = nextNode;
        }
        return reverseHead;
    }
    
}

