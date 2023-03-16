/**
 * https://leetcode.cn/problems/invert-binary-tree/
 * @author csy
 *
 */

// MARK: - Solution
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    /**
     * 队列，广度优先搜索
     * 时间复杂度：O(n)，其中 n 为二叉树的节点个数
     * 空间复杂度：O(n)，其中 n 为函数堆栈深度
     * @param root
     * @return
     */
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var lists = [[Int]]()
        if root == nil {
            return lists
        }
        var queue = [TreeNode?]()
        queue.append(root)
        while queue.isEmpty == false {
            var size = queue.count
            var list = [Int]()
            while size > 0 {
                size -= 1
                let f = queue.removeLast()
                if let val = f?.val {
                    list.append(val)
                }
                
                if f?.left != nil {
                    queue.append(f?.left)
                }
                if f?.right != nil {
                    queue.append(f?.right)
                }
            }
            lists.append(list)
        }
        return lists
    }
}
