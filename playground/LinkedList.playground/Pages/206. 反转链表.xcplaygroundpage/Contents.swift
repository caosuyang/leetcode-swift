/**
 * https://leetcode.cn/problems/reverse-linked-list/
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
 * 时间复杂度：O（n）
 * 空间复杂度：O（1）
 * @param head
 * @return
 */
func reverseList(_ head: ListNode?) -> ListNode? {
    return reverseList(prev: nil, cur: head)
}

func reverseList(prev: ListNode?, cur: ListNode?) -> ListNode? {
    if cur == nil { return prev }
    var next = cur?.next
    cur?.next = prev
    return reverseList(prev: cur, cur: next)
}

/**
 * 迭代+三指针
 * 时间复杂度：O（n）
 * 空间复杂度：O（1）
 * @param head
 * @return
 */
func reverseList1(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil { return head }
    var prev: ListNode?
    var cur = head
    var next: ListNode?
    
    while cur != nil {
        next = cur?.next
        cur?.next = prev
        prev = cur
        cur = next
    }
    return prev
    
}
