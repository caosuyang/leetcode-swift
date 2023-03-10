/**
 追溯
 https://leetcode.cn/problems/generate-parentheses/
 */
/**
 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
 示例 1：
 输入：n = 3
 输出：["((()))","(()())","(())()","()(())","()()()"]
 示例 2：
 输入：n = 1
 输出：["()"]
 提示：
 1 <= n <= 8
 */
/**
 方法一：解答错误
 */
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var list = [String]()
        if n < 0 { return list }
        var str = [Character]()
        dfs(0, n, n, &str, &list)
        return list
    }
    
    /// 深度优先搜索
    /// - Parameters:
    ///   - idx: 搜索的层号
    ///   - leftRemain: 左括号剩余数量
    ///   - rightRemain: 右括号剩余数量
    ///   - string: 用来存放每一层的选择
    ///   - list: 存放括号组合的数组
    func dfs(_ idx: Int, _ leftRemain: Int, _ rightRemain: Int, _ string: inout [Character], _ list: inout [String]) {
        
        if idx == string.count {
            let str: String = String(string)
            list.append(str)
            return
        }
        
        // 枚举这一层所有可能的选择
        // 选择一种可能之后，进入下一层搜索
        
        // 左括号的数量 > 0，选择左括号，然后进入下一层搜索
        if leftRemain > 0 {
            string[idx] = "("
            dfs(idx + 1, leftRemain - 1, rightRemain, &string, &list)
        }
        
        // 当左括号、右括号数量一致，选择左括号
        // 当右括号数量大于0 且 右括号数量 不等于 左括号数量
        // 选择右括号，进入下一层搜索
        if rightRemain > 0 && leftRemain != rightRemain {
            string[idx] = ")"
            dfs(idx + 1, leftRemain, rightRemain - 1, &string, &list)
        }
    }
}
