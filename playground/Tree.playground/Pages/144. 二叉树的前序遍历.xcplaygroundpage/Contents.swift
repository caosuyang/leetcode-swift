/**
 * https://leetcode.cn/problems/binary-tree-preorder-traversal/
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
    private var list = [Int]()
    /**
     * 递归，深度优先搜索
     * 时间复杂度：O(n)，其中 n 为二叉树的节点个数
     * 空间复杂度：O(n)，其中 n 为函数堆栈深度
     * @param root
     * @return
     */
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return list
        }
        if let val = root?.val {
            list.append(val)
        }
        preorderTraversal(root?.left)
        preorderTraversal(root?.right)
        return list
    }
    
    /**
     * 栈，深度优先搜索
     * 时间复杂度：O(n)，其中 n 为二叉树的节点个数
     * 空间复杂度：O(n)，其中 n 为函数堆栈深度
     * @param root
     * @return
     */
    func preorderTraversal1(_ root: TreeNode?) -> [Int] {
        var list = [Int]()
        if root == nil {
            return list
        }
        var stack = [TreeNode?]()
        var node = root
        while true {
            while node != nil {
                if let val = node?.val {
                    list.append(val)
                }
                stack.append(node?.right)
                node = node?.left
            }
            while node == nil {
                if stack.isEmpty {
                    return list
                } else {
                    let l = stack.removeLast()
                    node = l
                }
            }
        }
    }
    
    /**
     * 栈，优化，深度优先搜索
     * 时间复杂度：O(n)，其中 n 为二叉树的节点个数
     * 空间复杂度：O(n)，其中 n 为函数堆栈深度
     * @param root
     * @return
     */
    func preorderTraversal2(_ root: TreeNode?) -> [Int] {
        var list = [Int]()
        if root == nil {
            return list
        }
        var stack = [TreeNode?]()
        stack.append(root)
        while stack.isEmpty == false {
            let l = stack.removeLast()
            if let val = l?.val {
                list.append(val)
            }
            if l?.right != nil {
                stack.append(l?.right)
            }
            if l?.left != nil {
                stack.append(l?.left)
            }
        }
        return list
    }
}
