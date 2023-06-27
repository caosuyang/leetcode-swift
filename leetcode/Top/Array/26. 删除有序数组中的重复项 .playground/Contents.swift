/**
 * https://leetcode.cn/problems/remove-duplicates-from-sorted-array/
 * @author csy
 *
 */

/**
* 方法一：暴力枚举
* 时间复杂度O(n^2)
* 空间复杂度O(1)
*/
/**
* 方法一：暴力法
* 时间复杂度：O(n)
* 空间复杂度：O(n)
*/
func plusOne(_ digits: [Int]) -> [Int] {
    let len = digits.count
    var dig = 0
    for i in 0..<len {
        dig = dig + digits[i] * (len - i)
    }

    dig = dig + 1

    var newDigits = [Int]()
    
    for i in 0..<dig.words.count {
        let d: Int = Int(dig.words[i])
        newDigits.append(d)
    }
}
