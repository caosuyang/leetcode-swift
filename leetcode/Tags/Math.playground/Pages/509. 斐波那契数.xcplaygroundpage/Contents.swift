/**
 * https://leetcode.cn/problems/fibonacci-number/description/
 * @author csy
 *
 */

// MARK: - Solution
/**
 * 递归
 * 时间复杂度：O(2^n)
 * 空间复杂度：O(n)
 * @param n
 * @return
 */
func fib(_ n: Int) -> Int {
    if n < 2 {
        return n
    }
    return fib(n - 1) + fib(n - 2)
}

/**
 * 动态规划
 * 只需要前两个元素，用滚动数组替代
 * 时间复杂度：O(n)
 * 空间复杂度：O(1)
 * @param n
 * @return
 */
func fib1(_ n: Int) -> Int {
    if n < 2 {
        return n
    }
    var first = 0
    var second = 1
    for _ in 2...n {
        second += first
        first = second - first
    }
    return second
}

// MARK: - Test
print(fib(2) == 1)
print(fib(3) == 2)
print(fib(4) == 3)
print(fib1(2) == 1)
print(fib1(3) == 2)
print(fib1(4) == 3)
