/**
 https://leetcode.cn/problems/maximum-subarray/
 */
class Solution {
    /**
     方法一：暴力法
     穷举出所有可能连续子序列，并计算它们的和，最后取它们中最大值
     时间复杂度 n^3
     空间复杂度 1
     */
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        } else if nums.count == 1 {
            return nums.first ?? 0
        }
        var max = Int.min
        for begin in 0..<nums.count {
            for end in begin..<nums.count {
                var sum = 0
                for i in begin...end {
                    sum += nums[i]
                }
                max = max < sum ? sum : max
            }
        }
        return max
    }
}

class Solution1 {
    /**
     方法二：暴力法优化
     重复利用前面计算过的结果
     时间复杂度 n^2
     空间复杂度 1
     */
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        } else if nums.count == 1 {
            return nums.first ?? 0
        }
        var max = Int.min
        for begin in 0..<nums.count {
            var sum = 0
//            for end in begin..<nums.count {
//                sum += nums[end]
//            }
//            max = max > sum ? max : sum
            for end in begin..<nums.count {
                sum += nums[end]
                max = max > sum ? max : sum
            }
        }
        return max
    }
}

class Solution2 {
    /**
     方法三：分治
     将序列均匀的分割成两个子序列
     时间复杂度 nlogn
     空间复杂度 logn
     */
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        } else if nums.count == 1 {
            return nums.first ?? 0
        }
        return maxSubArray(nums, 0, nums.count)//logn
    }
    
    /**
     假设 [begin , end) 的最大连续子序列和是 S[i , j) ，那么它有 3 种可能
     1. [i , j) 存在于 [begin , mid) 中，同时 S[i , j) 也是 [begin , mid) 的最大连续子序列和
     2. [i , j) 存在于 [mid , end) 中，同时 S[i , j) 也是 [mid , end) 的最大连续子序列和
     3. [i , j) 一部分存在于 [begin , mid) 中，另一部分存在于 [mid , end) 中
        [i , j) = [i , mid) + [mid , j)
        S[i , mid) = max { S[k , mid) }，begin ≤ k ＜ mid
        S[mid , j) = max { S[mid , k) }，mid ＜ k ≤ end
     */
    func maxSubArray(_ nums: [Int], _ begin: Int, _ end: Int) -> Int {
        // !!
        if end - begin < 2 { return nums[begin] }
//        let mid = (end - begin) >> 1
        let mid = (begin + end) >> 1
        
//        var leftMax = nums[mid]
        var leftMax = nums[mid - 1]
//        var leftSum = 0
        var leftSum = leftMax
//        for end in (0..<mid).reversed() {
        for i in (begin..<(mid - 1)).reversed() {
            leftSum += nums[i]
//            leftMax = leftMax > leftSum ? leftMax : leftSum
            leftMax = max(leftMax, leftSum)
        }
//        var rightMax = nums[mid + 1]
        var rightMax = nums[mid]
//        var rightSum = 0
        var rightSum = rightMax
//        for begin in (mid + 1)..<nums.count {//n
        for i in (mid + 1)..<end {//n
            rightSum += nums[i]
//            rightMax = rightMax > rightSum ? rightMax : rightSum
            rightMax = max(rightMax, rightSum)
        }
//        var max = leftMax + rightMax
//        let lMax = maxSubArray(nums, begin, mid)//logn
//        let rMax = maxSubArray(nums, mid, end)
//        max = max > lMax ? max : lMax
//        max = max > rMax ? max : rMax
//        return max
        return max(leftMax + rightMax, max(maxSubArray(nums, begin, mid), maxSubArray(nums, mid, end)))
    }
    
    func max(_ left: Int, _ right: Int) -> Int {
        return left > right ? left : right
    }
}
