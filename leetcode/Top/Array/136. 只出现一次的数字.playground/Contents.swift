/**
 * 136. 只出现一次的数字
 * https://leetcode.cn/problems/single-number/
 * @author csy
 */

/**
 给你一个 非空 整数数组 nums ，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

 你必须设计并实现线性时间复杂度的算法来解决此问题，且该算法只使用常量额外空间。
 */

/**
 提示：

 1 <= nums.length <= 3 * 104
 -3 * 104 <= nums[i] <= 3 * 104
 除了某个元素只出现一次以外，其余每个元素均出现两次。
 */

/**
 位运算
 数组
 */

/**
* 方法一：哈希表
* 时间复杂度：O(n)
* 空间复杂度：O(n)
* 解答错误❌
*/
func singleNumber(_ nums: [Int]) -> Int {
    let len = nums.count
    if len == 1 {
        return nums[0]
    }
    
    var hashtable = [Int:Int]()
 
    for i in 0..<len {
        let num = nums[i]
        hashtable[num] = (hashtable[num] ?? 0) + 1
    }
    
    hashtable = hashtable.filter { dic in
        dic.value > 1
    }
    
    if let value: Int = hashtable.values.first {
        return value
    }
    return -1
}

/**
* 方法二：位运算
* 任何数于0异或为任何数 0 ^ n => n 2.相同的数异或为0: n ^ n => 0
* 时间复杂度：O(n)，其中 n 是数组长度。只需要对数组遍历一次。
* 空间复杂度：O(1)
*/
func singleNumber2(_ nums: [Int]) -> Int {
    var single = 0
    for num in nums {
        single = single ^ num
    }
    return single
}

/**
 测试用例
 */
/**
 示例 1 ：

 输入：nums = [2,2,1]
 输出：1
 示例 2 ：

 输入：nums = [4,1,2,1,2]
 输出：4
 示例 3 ：

 输入：nums = [1]
 输出：1
 */
let nums1 = [2,2,1], output1 = 1
let nums2 = [4,1,2,1,2], output2 = 4
let nums3 = [1], output3 = 1

/**
 执行结果
 */
print("singleNumber")
print(singleNumber(nums1))
assert(singleNumber(nums1) == output1)

print("singleNumber2")
print(singleNumber2(nums2))
assert(singleNumber2(nums2) == output2)

/**
 控制台打印
 */

/**
 执行结果
 */
