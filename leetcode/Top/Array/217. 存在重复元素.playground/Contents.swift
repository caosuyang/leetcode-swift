/**
 * 217. 存在重复元素
 * https://leetcode.cn/problems/contains-duplicate/
 * @author csy
 */

/**
 给你一个整数数组 nums 。如果任一值在数组中出现 至少两次 ，返回 true ；如果数组中每个元素互不相同，返回 false 。
 */

/**
 提示：

 1 <= nums.length <= 105
 -109 <= nums[i] <= 109
 */

/**
 数组
 哈希表
 排序
 */

/**
* 方法一：哈希表
* 时间复杂度：O(n)，遍历一次
* 空间复杂度：O(n)，哈希表内存开销
*/
func containsDuplicate(_ nums: [Int]) -> Bool {
    let len = nums.count
    if len < 2 {
        return false
    }
    var hashtable = [Int:Int]()
    for i in 0..<len {
        let num = nums[i]
        let contains = hashtable.contains { key, value in
            key == num
        }
        if contains == true {
            return true
        } else {
            hashtable[num] = 1
        }
    }
    return false
}

/**
* 方法一：集合set
* 时间复杂度：O(n)，遍历一次
* 空间复杂度：O(n)，哈希表内存开销
*/
func containsDuplicate1(_ nums: [Int]) -> Bool {
    let len = nums.count
    if len < 2 {
        return false
    }
    var set: Set<Int> = Set<Int>()
    for num in nums {
        if set.contains(num) == true {
            return true
        } else {
            set.insert(num)
        }
    }
    return false
}

/**
* 方法二： 排序
* 时间复杂度：O(nlogn)，n为数组长度，一次排序后一次遍历
* 空间复杂度：O(logn)，排序调用栈深度
*/
func containsDuplicate2(_ nums: [Int]) -> Bool {
    let numsArr: [Int] = Array.sorted(nums)()
    let len = numsArr.count
    for i in 1..<len {
        if numsArr[i] == numsArr[i-1] {
            return true
        }
    }
    return false
}

/**
 测试用例
 */
/**
 示例 1：

 输入：nums = [1,2,3,1]
 输出：true
 示例 2：

 输入：nums = [1,2,3,4]
 输出：false
 示例 3：

 输入：nums = [1,1,1,3,3,4,3,2,4,2]
 输出：true
 */
let nums1 = [1,2,3,1], output1 = true
let nums2 = [1,2,3,4], output2 = false
let nums3 = [1,1,1,3,3,4,3,2,4,2], output3 = true


/**
 执行结果
 */
print("containsDuplicate")
print(containsDuplicate(nums1))
assert(containsDuplicate(nums1) == output1)

print("containsDuplicate2")
print(containsDuplicate2(nums2))
assert(containsDuplicate2(nums2) == output2)

/**
 控制台打印
 */

/**
 执行结果
 */
