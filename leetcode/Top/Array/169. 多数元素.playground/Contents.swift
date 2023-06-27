/**
 * 169. 多数元素
 * https://leetcode.cn/problems/majority-element/
 * @author csy
 */

/**
 给定一个大小为 n 的数组 nums ，返回其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。

 你可以假设数组是非空的，并且给定的数组总是存在多数元素。
 */

/**
 提示：
 n == nums.length
 1 <= n <= 5 * 104
 -109 <= nums[i] <= 109
 */

/**
 数组
 哈希表
 分治
 计数
 排序
 */

///**
//* 方法一：暴力法
//* 时间复杂度：O(nlog(m+n))，sorted排序时间复杂度为log(m+n)
//* 空间复杂度：O(log(m+n))，sorted排序栈空间为log(m+n)
//*/
//func majorityElement(_ nums: [Int]) -> Int {
//    let len = nums.count
//    let count = len >> 1
//
//    var total = 0
//    var set = Set<Int>()
//    for num in nums {
//        if set.contains(num) == true {
//            total = total + 1
//        } else {
//            set.insert(num)
//        }
//    }
//
//}

/**
* 方法二：排序
* 时间复杂度：O(nlogn)，nlogn为排序时间复杂度
* 空间复杂度：O(logn)，sorted排序算法使用logn栈空间
*/
func majorityElement2(_ nums: [Int]) -> Int {
    let numsArr = Array.sorted(nums)()
    return numsArr[nums.count >> 1]
}

/**
* 方法三：哈希表
* 时间复杂度：O(n)，n为数组长度
* 空间复杂度：O(n)，哈希表内存开销
* 解答错误❌
*/
func majorityElement3(_ nums: [Int]) -> Int {
    
    var hashtable = [Int:Int]()
    
    for num in nums {
        let containsKey = hashtable.contains { k, v in
            k == num
        }
        if containsKey {
            hashtable[num] = 1
        } else {
            hashtable[num] = (hashtable[num] ?? 0) + 1
        }
    }
    
    print("hashtable", hashtable)
    
    let len = nums.count
    
    for (_, item) in hashtable.enumerated() {
        let value: Int = item.value
        if value > (len >> 1) {
            return value
        }
    }
    return -1
}

/**
 测试用例
 */
/**
 示例 1：

 输入：nums = [3,2,3]
 输出：3
 示例 2：

 输入：nums = [2,2,1,1,1,2,2]
 输出：2
 */
let nums1 = [3,2,3], output1 = 3
let nums2 = [2,2,1,1,1,2,2], output2 = 2

/**
 执行结果
 */
print("majorityElement2")
print(majorityElement2(nums1))
assert(majorityElement2(nums1) == output1)

print("majorityElement2")
print(majorityElement3(nums2))
assert(majorityElement3(nums2) == output2)

/**
 控制台打印
 */

/**
 执行结果
 */
