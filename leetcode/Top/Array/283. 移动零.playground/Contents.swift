/**
 * 283. 移动零
 * https://leetcode.cn/problems/move-zeroes/description/
 * @author csy
 */

/**
* 方法一：暴力法
* 时间复杂度：O(n)，n为数组长度，最多遍历2次
* 空间复杂度：O(1)，需要常数空间存放变量，原地算法
*/
func moveZeroes(_ nums: inout [Int]) {
    let len = nums.count
    nums = nums.filter { num in
        num != 0
    }
    print("nums", nums)
    var count = len - nums.count
    while count > 0 {
        nums.append(0)
        count = count - 1
    }
}

/**
* 方法二：双指针
* 时间复杂度：O(n)，n为数组长度，快慢指针每个位置最多遍历2次
* 空间复杂度：O(1)，需要常数空间存放变量
*/
func moveZeroes2(_ nums: inout [Int]) {
    let len = nums.count
    var left = 0 , right = 0
    
    while right < len {
        if nums[right] != 0 {
            // swap
            let temp = nums[left]
            nums[left] = nums[right]
            nums[right] = temp

            left = left + 1
        }
        right = right + 1
    }
}

/**
 测试用例
 */
var nums1 = [0,1,0,3,12]
let output1 = [1,3,12,0,0]
var nums2 = [0]
let output2 = [0]

/**
 执行结果
 */
print("moveZeroes")
moveZeroes(&nums1)
moveZeroes(&nums2)
print(nums1)
print(nums2)
assert(nums1 == output1)
assert(nums2 == output2)

print("moveZeroes2")
nums1 = [0,1,0,3,12]
nums2 = [0]
moveZeroes2(&nums1)
moveZeroes2(&nums2)
print(nums1)
print(nums2)
assert(nums1 == output1)
assert(nums2 == output2)

/**
 控制台打印
 */
/**
 moveZeroes
 Swift/ContiguousArrayBuffer.swift:600: Fatal error: Index out of range
 */
