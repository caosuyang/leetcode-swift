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
    private var list = [Int]()
    /**
     * 递归，深度优先搜索
     * 时间复杂度：O(n)，其中 n 为二叉树的节点个数
     * 空间复杂度：O(n)，其中 n 为函数堆栈深度
     * @param root
     * @return
     */
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return list
        }
        
        inorderTraversal(root?.left)
        if let val = root?.val {
            list.append(val)
        }
        inorderTraversal(root?.right)
        return list
    }
    
    /**
     * 栈，深度优先搜索
     * 时间复杂度：O(n)，其中 n 为二叉树的节点个数
     * 空间复杂度：O(n)，其中 n 为函数堆栈深度
     * @param root
     * @return
     */
    func inorderTraversal1(_ root: TreeNode?) -> [Int] {
        var list = [Int]()
        if root == nil {
            return list
        }
        var stack = [TreeNode?]()
        var node = root
        while true {
            while node != nil {
                stack.append(node)
                node = node?.left
            }
            while node == nil {
                if stack.isEmpty {
                    return list
                } else {
                    let l = stack.removeLast()
                    node = l
                    if let val = node?.val {
                        list.append(val)
                    }
                    node = node?.right
                }
            }
        }
    }
}
