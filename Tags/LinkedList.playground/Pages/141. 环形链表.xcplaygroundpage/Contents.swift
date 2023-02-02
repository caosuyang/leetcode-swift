/**
 * https://leetcode.cn/problems/linked-list-cycle/
 * @author csy
 *
 */

// MARK: - Solution
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/**
快慢指针
*/
/**
 * 快慢指针
 * 时间复杂度 O（n）
 * 空间复杂度 O（1）
 * @param head
 * @return
 */
func hasCycle(_ head: ListNode?) -> Bool {
    if head == nil || head?.next == nil { return false }
    
    var slow = head;
    var fast = head?.next;
    
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        
        if slow === fast { return true }
    }
    
    return false
}
