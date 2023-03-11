/**
 * https://leetcode.com/problems/merge-sorted-array/
 * @author csy
 *
 */

// MARK: - Solution
/**
 * 三指针
 * 时间复杂度：O（n）
 * 空间复杂度：O（1）
 * @param nums1
 * @param m
 * @param nums2
 * @param n
 */
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var i1 = m - 1
    var i2 = n - 1
    var cur = m + n - 1
    
    while (i2 >= 0) {
        if i1 >= 0 && nums2[i2] < nums1[i1] {
            nums1[cur] = nums1[i1]
            i1 = i1 - 1
            cur = cur - 1
        } else {// i1 < 0 || nums2[i2] >= nums1[i1]
            nums1[cur] = nums2[i2]
            i2 = i2 - 1
            cur = cur - 1
        }
    }
}

// MARK: - Test
//var nums1 = [1,2,3,0,0,0]
//let m = 3
//let nums2 = [2,5,6]
//let n = 3
//let out = [1,2,2,3,5,6]
//merge(&nums1, m, nums2, n)
//print(nums1 == out)

//var nums1 = [1]
//let m = 1
//let nums2: [Int] = []
//let n = 0
//let out = [1]
//merge(&nums1, m, nums2, n)
//print(nums1 == out)

var nums1 = [0]
let m = 0
let nums2 = [1]
let n = 1
let out = [1]
merge(&nums1, m, nums2, n)
print(nums1 == out)
