/**
 给一个数字串，比如 2 ，3，-1，29，-10，6，60，求子串和最大的串？
 */

class Solution {
    /**
     方法一：暴力法
     穷举出所有可能连续子序列，并计算它们的和，最后取它们中最大值
     时间复杂度 n^3
     空间复杂度 1
     */
    func maxSubArray(_ nums: [Int]) -> [Int] {
        if nums.count < 2  { return nums }
        var sub = [Int]()
        var total = Int.min
        for begin in 0..<nums.count {
            for end in begin..<nums.count {
                var sum = 0
                for i in begin...end {
                    sum += nums[i]
                }
                if sum > total {
                    sub = [Int]()
                    var index = 0
                    for i in begin...end {
                        sub[index] = nums[i]
                        index += 1
                    }
                }
            }
        }
        return sub
    }
}
