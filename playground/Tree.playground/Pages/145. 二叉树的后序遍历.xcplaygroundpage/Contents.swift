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
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return list
        }
        
        postorderTraversal(root?.left)
        postorderTraversal(root?.right)
        if let val = root?.val {
            list.append(val)
        }
        return list
    }
    
    /**
     * 栈，深度优先搜索
     * 时间复杂度：O(n)，其中 n 为二叉树的节点个数
     * 空间复杂度：O(n)，其中 n 为函数堆栈深度
     * @param root
     * @return
     */
    func postorderTraversal1(_ root: TreeNode?) -> [Int] {
        var list = [Int]()
        if root == nil {
            return list
        }
        var stack = [TreeNode?]()
        stack.append(root)
        var last: TreeNode?
        while stack.isEmpty == false {
            var p: TreeNode?
            if let l = stack.last {
                p = l
            }
            let isLeaf = p?.left == nil && p?.right == nil
            let isSub = last != nil && (last === p?.left || last === p?.right)
            if isLeaf || isSub {
                let top = stack.removeLast()
                if let val = top?.val {
                    list.append(val)
                }
                last = top
            } else {
                if p?.right != nil {
                    stack.append(p?.right)
                }
                if p?.left != nil {
                    stack.append(p?.left)
                }
            }
        }
        return list
    }
}
