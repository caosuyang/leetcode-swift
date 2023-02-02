/**
 * https://leetcode.cn/problems/middle-of-the-linked-list/description/
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
 * 数组
 * 时间复杂度：O（n）
 * 空间复杂度：O（1）
 * @param head
 * @return
 */
func middleNode(_ head: ListNode?) -> ListNode? {
    var nodes = [ListNode?]()
    var cur = head
    while cur != nil {
        nodes.append(cur)
        nodes[1] = cur
        cur = cur?.next
    }

    return nodes[nodes.count/2]
}

/**
 * 两次遍历
 * 时间复杂度：O（n）
 * 空间复杂度：O（1）
 * @param head
 * @return
 */
func middleNode1(_ head: ListNode?) -> ListNode? {
    var cur = head
    var i = 0
    while cur != nil {
        i += 1
        cur = cur?.next
    }
    cur = head
    var j = 0
    while j < i / 2 {
        j += 1
        cur = cur?.next
    }
    return cur
}

/**
 * 快慢指针
 * 时间复杂度：O（n）
 * 空间复杂度：O（1）
 * @param head
 * @return
 */
func middleNode2(_ head: ListNode?) -> ListNode? {
    var slow = head, fast = head

    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    return slow
}
