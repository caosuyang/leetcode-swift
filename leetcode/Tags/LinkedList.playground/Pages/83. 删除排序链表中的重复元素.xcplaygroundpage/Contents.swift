/**
 * https://leetcode.cn/problems/remove-duplicates-from-sorted-list/description/
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
 * 迭代
 * 时间复杂度：O（n）
 * 空间复杂度：O（1）
 * @param head
 * @return
 */
func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil { return head }

    var newHead: ListNode? = ListNode(0)
    newHead?.next = head
    var aHead: ListNode? = newHead
    var bHead: ListNode? = newHead?.next

    while aHead?.next != nil && bHead?.next != nil {
        
        if aHead?.next?.val == bHead?.next?.val {
            aHead?.next = aHead?.next?.next
        } else {
            aHead = aHead?.next
        }
        bHead = bHead?.next
    }
    return newHead?.next
}

/**
 * 一次遍历
 * 时间复杂度：O（n）
 * 空间复杂度：O（1）
 * @param head
 * @return
 */
func deleteDuplicates1(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil { return head }

    var cur = head

    while cur?.next != nil {

        if cur?.val == cur?.next?.val {
            cur?.next = cur?.next?.next
        } else {
            cur = cur?.next
        }
    }

    return head
}

/**
 * 一次遍历，边界优化
 * 时间复杂度：O（n）
 * 空间复杂度：O（1）
 * @param head
 * @return
 */
func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
    var cur = head

    while cur != nil && cur?.next != nil {

        if cur?.val == cur?.next?.val {
            cur?.next = cur?.next?.next
        } else {
            cur = cur?.next
        }
    }

    return head
}
