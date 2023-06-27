/**
 * 121. 买卖股票的最佳时机
 * https://leetcode.cn/problems/best-time-to-buy-and-sell-stock/description/
 * @author csy
 */

/**
 * 方法一：暴力法
 * 时间复杂度：O(n^2)，n为数组长度，2层遍历for循环
 * 空间复杂度：O(1)，需要常数空间存放变量
 */
func maxProfit(_ prices: [Int]) -> Int {
    let len = prices.count
    var max = 0
    for i in 0..<len {
        for j in i+1..<len {
            let newMax = prices[j] - prices[i]
            if newMax > max {
                max = newMax
            }
        }
    }
    return max
}

/**
 * 方法二：一次遍历
 * 时间复杂度：O(n)，n为数组长度，一次遍历记录历史最低价格
 * 空间复杂度：O(1)，需要常数空间存放变量
 */
func maxProfit2(_ prices: [Int]) -> Int {
    var min = Int.max
    var max = 0
    let len = prices.count
    for i in 0..<len {
        if prices[i] < min { // 记录最低价格
            min = prices[i]
        } else if prices[i] - min > max { // 记录差价最大价格
            max = prices[i] - min
        }
    }
    return max
}

/**
 测试用例
 */
let prices1 = [7,1,5,3,6,4]
let output1 = 5
let prices2 = [7,6,4,3,1]
let output2 = 0

/**
 执行结果
 */
print("maxProfit")
print(maxProfit(prices1))
print(maxProfit(prices2))
assert(maxProfit(prices1) == output1)
assert(maxProfit(prices2) == output2)

print("maxProfit2")
print(maxProfit2(prices1))
print(maxProfit2(prices2))
assert(maxProfit2(prices1) == output1)
assert(maxProfit2(prices2) == output2)

/**
 控制台打印
 */
/**
 expression failed to parse:
 error: 121. 买卖股票的最佳时机 .playground:27:1: error: unterminated '/*' comment

 ^
 */

 121. 买卖股票的最佳时机 .playground:25:1: note: comment started here
 /**
 ^
  */*/
