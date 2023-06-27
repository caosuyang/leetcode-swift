/**
 * 66. 加一
 * https://leetcode.cn/problems/plus-one/
 * @author csy
 */

/**
* 方法一：找出最长的后缀 9
* 时间复杂度：O(n)，n是digits数组长度
* 空间复杂度：O(1)，返回值不计入空间复杂度
*/
func plusOne(_ digits: [Int]) -> [Int] {
    let len = digits.count
    var newDigits = digits
    for i in (0..<len).reversed() {
        if newDigits[i] != 9 {
            newDigits[i] = newDigits[i] + 1

            for j in i+1..<len {
                newDigits[j] = 0
            }
            return newDigits
        }
    }

    // digits 中所有的元素均为 9
    var ans = Array<Int>(repeating: 0, count: len + 1)
    ans[0] = 1
    return ans
}


/**
 测试用例
 */
/**
 示例 1：

 输入：digits = [1,2,3]
 输出：[1,2,4]
 解释：输入数组表示数字 123。
 示例 2：

 输入：digits = [4,3,2,1]
 输出：[4,3,2,2]
 解释：输入数组表示数字 4321。
 示例 3：

 输入：digits = [0]
 输出：[1]
 */
let digits1 = [1,2,3], output1 = [1,2,4]
let digits2 = [4,3,2,1], output2 = [4,3,2,2]
let digits3 = [0], output3 = [1]

/**
 执行结果
 */
print("plusOne")
print(plusOne(digits1))
assert(plusOne(digits1) == output1)
print(plusOne(digits2))
assert(plusOne(digits2) == output2)
print(plusOne(digits3))
assert(plusOne(digits3) == output3)

/**
 控制台打印
 */

/**
 执行结果
 */
