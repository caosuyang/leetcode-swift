/**
 * 118. 杨辉三角
 * https://leetcode.cn/problems/pascals-triangle/
 * @author csy
 */

/**
 给定一个非负整数 numRows，生成「杨辉三角」的前 numRows 行。

 在「杨辉三角」中，每个数是它左上方和右上方的数的和。
 */

/**
 提示:

 1 <= numRows <= 30
 */

/**
 数组
 动态规划
 */

/**
* 方法一：数学性质
* 时间复杂度：O(numRows^2)
* 空间复杂度：O(1)，不考虑返回值的空间占用
*/
func generate(_ numRows: Int) -> [[Int]] {
    var ret = Array<Array<Int>>()
    for i in 0..<numRows {
        var row = Array<Int>()
        for j in 0...i {
            if j == 0 || j == i {
                row.append(1)
            } else {
                row.append(ret[i - 1][j - 1] + ret[i - 1][j])
            }
        }
        ret.append(row)
    }
    return ret
}

/**
 测试用例
 */
/**
 示例 1:

 输入: numRows = 5
 输出: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
 示例 2:

 输入: numRows = 1
 输出: [[1]]
 */
let numRows1 = 5, output1 = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
let numRows2 = 1, output2 = [[1]]

/**
 执行结果
 */
print("generate")
print(generate(numRows1))
assert(generate(numRows1) == output1)

print(generate(numRows2))
assert(generate(numRows2) == output2)
/**
 控制台打印
 */

/**
 执行结果
 */
