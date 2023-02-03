/**
 * https://leetcode.cn/problems/score-of-parentheses/
 * @author csy
 *
 */

// MARK: - Solution
/**
 * 栈
 * 时间复杂度：O(n)
 * 空间复杂度：O(n)
 * @param s
 * @return
 */
func scoreOfParentheses(_ s: String) -> Int {
    var stack = [Int]()
    stack.append(0)
    s.forEach { c in
        if c == "(" { // 左括号
            stack.append(0)
        } else { // 右括号
            let a = stack.removeLast()
            if a == 0 {
                stack.append(stack.removeLast() + 1)
            } else {
                stack.append(stack.removeLast() + 2 * a)
            }
        }
    }
    return stack.last ?? 0
}
