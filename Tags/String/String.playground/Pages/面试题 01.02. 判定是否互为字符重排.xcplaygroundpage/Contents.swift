import UIKit

var greeting = "Hello, playground"

/**
 * https://leetcode-cn.com/problems/check-permutation-lcci/
 * @author csy
 *
 */


/**
 * A.排序
 * @param s1
 * @param s2
 * @return
 */
func CheckPermutationA(_ s1: String, _ s2: String) -> Bool {
    if s1.count != s2.count {
        return false
    }
    return s1.sorted() == s2.sorted()
}

/**
 * B.哈希表
 * @param s1
 * @param s2
 * @return
 */
func CheckPermutationB(_ s1: String, _ s2: String) -> Bool {
    if s1.count != s2.count {
        return false
    }
    var chars: [UInt8] = []
    for char in s1 {
        chars[char.asciiValue ?? 0] += 1
    }
    for char in s2 {
        chars[char.asciiValue ?? ] -= 1
        if chars[char.asciiValue ?? 0] < 0 {
            return false
        }
    }
    return true
}
