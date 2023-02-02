/**
 * https://leetcode.cn/problems/delete-node-in-a-linked-list/
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
 * 从尾部合并到头部以避免覆盖
 * 时间复杂度：O（n）
 * 空间复杂度：O（1）
 * @param node
 */
func deleteNode(_ node: ListNode?) {
    node?.val = node?.next?.val ?? 0;
    node?.next = node?.next?.next;
}
