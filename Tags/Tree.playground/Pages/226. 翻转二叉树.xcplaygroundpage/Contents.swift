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
     * 递归+前序遍历
     * 时间复杂度：O(n)
     * 空间复杂度：O(n)
     * 平均空间复杂度：O(logn)
     * 最坏空间复杂度：O(n)
     * @param root
     * @return
     */
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return root
        }
        let tmp = root?.left
        root?.left = root?.right
        root?.right = tmp
        invertTree(root?.left)
        invertTree(root?.right)
        return root
    }
}

class Solution2 {
    /**
     * 递归+中序遍历
     * 时间复杂度：O(n)
     * 空间复杂度：O(n)
     * 平均空间复杂度：O(logn)
     * 最坏空间复杂度：O(n)
     * @param root
     * @return
     */
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return root
        }
        invertTree(root?.left)
        let tmp = root?.left
        root?.left = root?.right
        root?.right = tmp
        invertTree(root?.right)
        return root
    }
}

class Solution3 {
    /**
     * 递归+后序遍历
     * 时间复杂度：O(n)
     * 空间复杂度：O(n)
     * 平均空间复杂度：O(logn)
     * 最坏空间复杂度：O(n)
     * @param root
     * @return
     */
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return root
        }
        invertTree(root?.left)
        invertTree(root?.right)
        let tmp = root?.left
        root?.left = root?.right
        root?.right = tmp
        return root
    }
}

class Solution4 {
    /**
     * 迭代+队列+层序遍历
     * 时间复杂度：O(n)
     * 空间复杂度：O(n)
     * @param root
     * @return
     */
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return root
        }
        var queue = [TreeNode?]()
        queue.append(root)
        
        while queue.isEmpty == false {
            let f = queue.removeFirst();
            let tmp = f?.left
            f?.left = f?.right
            f?.right = tmp
            // 1.如果从queue出队的node的left不为空
            if f?.left != nil {
                queue.append(f?.left)
            }
            // 2.如果从queue出队的node的right不为空
            if f?.right != nil {
                queue.append(f?.right)
            }
        }
        return root
    }
}
