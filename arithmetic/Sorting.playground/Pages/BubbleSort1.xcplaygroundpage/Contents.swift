/**
 * 冒泡排序（Bubble Sort）
 * 方法一：两层遍历
 * 912. 排序数组
 * https://leetcode.cn/problems/sort-an-array/
 * @author csy
 *
 */
/**
 * 两层遍历
 * 最坏、平均、最优时间复杂度，总是需要两层遍历 O(n^2)
 * 空间复杂度 O(1)，没有额外堆空间和递归调用
 * 属于稳定的排序算法，nums[begin - 1] > nums[begin]
 * 属于原地算法，没有依赖外部资源，只对传入参数nums进行修改和覆盖
 * leetcode执行结果：11 / 20 个通过的测试用例，超出时间限制
 * @param nums
 * @return
 */
func sortArray(_ nums: [Int]) -> [Int] {
    var nums1 = nums
    var end = nums1.count - 1
    while end > 0 {
        for begin in 1...end {
            if nums1[begin] < nums1[begin - 1] {
                let temp = nums1[begin]
                nums1[begin] = nums1[begin - 1]
                nums1[begin - 1] = temp
            }
        }
        end -= 1
    }
    return nums1
}

var array = [5, 1, 1, 2, 0, 0]
array = sortArray(array)
for i in array {
    print(i)
}
