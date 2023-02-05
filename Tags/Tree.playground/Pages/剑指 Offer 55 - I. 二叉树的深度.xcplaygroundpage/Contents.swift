/**
 * https://leetcode.cn/problems/er-cha-shu-de-shen-du-lcof/
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
     * 递归，深度优先搜索
     * 时间复杂度：O(n)，其中 n 为二叉树的节点个数
     * 空间复杂度：O(height)，其中 height 表示二叉树的高度
     * @param root
     * @return
     */
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let leftDeep = maxDepth(root?.left)
        let rightDeep = maxDepth(root?.right)
        return max(leftDeep, rightDeep) + 1
    }
}

class Solution1 {
    /**
     * 迭代，队列，层序遍历，广度优先搜索
     * 时间复杂度：O(n)，其中 n 为二叉树的节点个数
     * 空间复杂度：O(n)，其中 n 为队列存储的元素数量
     * @param root
     * @return
     */
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var queue = [TreeNode?]()
        queue.append(root)
        
        var deep = 0
        while queue.isEmpty == false {
            var size = queue.count
            
            while size > 0 {
                size -= 1
                let f = queue.removeFirst()
                // 1.如果从queue出队的node的left不为空
                if f?.left != nil {
                    queue.append(f?.left)
                }
                // 2.如果从queue出队的node的right不为空
                if f?.right != nil {
                    queue.append(f?.right)
                }
            }
            deep += 1
        }
        return deep
    }
}
