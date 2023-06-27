/**
 * 88. 合并两个有序数组
 * https://leetcode.cn/problems/merge-sorted-array/description/
 * @author csy
 */

/**
* 方法一：直接合并后排序
* 时间复杂度：O(nlog(m+n))，sorted排序时间复杂度为log(m+n)
* 空间复杂度：O(log(m+n))，sorted排序栈空间为log(m+n)
*/
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    for i in 0..<n {
        nums1[m + i] = nums2[i]
    }
    // sort
    nums1 = nums1.sorted { num1, num2 in
        num1 < num2
    }
}

/**
* 方法二：双指针
* 时间复杂度：O(m+n)，n、m为数组长度，1层遍历for循环
* 空间复杂度：O(m+n))，需要m+n空间存放变量
*/
func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var p1 = 0, p2 = 0
    var num3 = [Int]()
    var cur = 0

    while p1 < m || p2 < n {
        if nums1[p1] < nums2[p2] {
            num3[cur] = nums1[p1]
            cur = cur + 1
            p1 = p1 + 1
        } else {
            num3[cur] = nums2[p2]
            cur = cur + 1
            p2 = p2 + 1
        }
    }
    nums1 = num3
}

/**
* 方法三：双指针
* 时间复杂度：O(m+n)，n、m为数组长度，1层遍历for循环
* 空间复杂度：O(m+n))，需要m+n空间存放变量
*/
func merge3(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var p1 = 0, p2 = 0
    var num3 = [Int]()
    var cur = 0

    while p1 < m || p2 < n {
        if p1 == m {
            cur = nums2[p2]
            p2 = p2 + 1
        } else if  p2 == n {
            cur = nums1[p1]
            p1 = p1 + 1
        } else if nums1[p1] < nums2[p2] {
            cur = nums1[p1]
            p1 = p1 + 1
        } else {
            cur = nums2[p2]
            p2 = p2 + 1
        }
        num3[p1 + p2 - 1] = cur
    }
    nums1 = num3
}

/**
 测试用例
 */
var nums1 = [1,2,3,0,0,0]
let m1 = 3, nums2 = [2,5,6], n1 = 3, output1 = [1,2,2,3,5,6]
var nums3 = [1]
let m2 = 1, nums4: [Int] = [], n2 = 0, output2 = [1]
var nums5 = [0]
let m3 = 0, nums6 = [1], n3 = 1, output3 = [1]


/**
 执行结果
 */
//print("merge1")
//merge(&nums1, m1, nums2, n1)
//print(nums1)
//assert(nums1 == output1)
//
//print("merge2")
//merge2(&nums3, m2, nums4, n2)
//print(nums3)
//assert(nums3 == output2)

print("merge3")
merge3(&nums5, m3, nums6, n3)
print(nums5)
assert(nums5 == output1)

/**
 控制台打印
 */

/**
 执行结果
 */
/**
 process exited with signal SIGILL
 */
