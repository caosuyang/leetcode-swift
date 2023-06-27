/**
 * 1. 两数之和
 * https://leetcode.cn/problems/two-sum/description/
 * @author csy
 */

/**
* 方法一：暴力枚举
* 时间复杂度O(n^2)，n是数组nums中元素数量，最坏情况数组内任意两个数都要匹配一次
* 空间复杂度O(1)
*/
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    let len = nums.count

    for i in 0 ..< len {
        for j in (i + 1) ..< len {
            let e3 = nums[j]
            if nums[j] == target - nums[i] {
                var indexs = [Int]()
                indexs.append(i)
                indexs.append(j)
                return indexs
            }
        }
    }
    return [Int]()
}

/**
* 方法二：哈希表
* 时间复杂度O(n)，n是数组元素数量，遍历一次，对每个元素x，使用O(1)时间复杂度去找target-x元素的index
* 空间复杂度O(n)，n是数组元素数量，申请哈希表内存开销
*/
func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    // ele:index
    var hashtable = [Int:Int]()
    
    let len = nums.count
    for i in 0 ..< len {
        let contains = hashtable.contains(where: { key, value in
            key == target - nums[i]
        })
        
        if contains == true {
            var indexs = [Int]()
            if let index = hashtable[target - nums[i]] {
                indexs.append(index)
                indexs.append(i)
                return indexs
            }
        }
        hashtable[nums[i]] = i
    }
    return [Int]()
}

/**
 测试用例
 */
let nums1 = [2,7,11,15], target1 = 9, output1 = [0,1]
let nums2 = [3,2,4], target2 = 6, output2 = [1,2]
let nums3 = [3,3], target3 = 6, output3 = [0,1]

/**
 执行结果
 */
print("twoSum")
print(twoSum(nums1, target1))
print(twoSum(nums2, target2))
print(twoSum(nums3, target3))
assert(twoSum(nums1, target1) == output1)
assert(twoSum(nums2, target2) == output2)
assert(twoSum(nums3, target3) == output3)

print("twoSum2")
print(twoSum2(nums1, target1))
print(twoSum2(nums2, target2))
print(twoSum2(nums3, target3))
assert(twoSum2(nums1, target1) == output1)
assert(twoSum2(nums2, target2) == output2)
assert(twoSum2(nums3, target3) == output3)
