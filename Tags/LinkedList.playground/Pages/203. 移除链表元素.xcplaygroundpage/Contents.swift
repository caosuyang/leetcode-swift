/**
 * https://leetcode.cn/problems/remove-linked-list-elements/description/
 * @author csy
 *
 */

// MARK: - Solution
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/**
 * 递归
 * 时间复杂度：O（2^n）
 * 空间复杂度：O（n）
 * @param head
 * @param val
 * @return
 */
func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    if head == nil { return head }
    
    head?.next = removeElements(head?.next, val)
    
    if head?.val == val {
        return head?.next
    } else {
        return head
    }
}

/**
 * 迭代
 * 时间复杂度：O（n）
 * 空间复杂度：O（n）
 * @param head
 * @param val
 * @return
 */
func removeElements1(_ head: ListNode?, _ val: Int) -> ListNode? {
    var newHead: ListNode? = ListNode(0)
    newHead?.next = head
    var tmp = newHead

    while tmp?.next != nil {
        if tmp?.next?.val == val {
            tmp?.next = tmp?.next?.next
        } else {
            tmp = tmp?.next
        }
    }

    return newHead?.next
}
