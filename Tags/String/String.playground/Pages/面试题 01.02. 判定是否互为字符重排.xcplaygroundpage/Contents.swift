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
 * B.数组
 * @param s1
 * @param s2
 * @return
 */
func CheckPermutationB(_ s1: String, _ s2: String) -> Bool {
    if s1.count != s2.count {
        return false
    }
    var chars: [Int] = [Int](repeating: 0, count: 128)
    for char in s1 {
        chars[Int(char.asciiValue ?? 0)] += 1
    }
    for char in s2 {
        chars[Int(char.asciiValue ?? 0)] -= 1
        if chars[Int(char.asciiValue ?? 0)] < 0 {
            return false
        }
    }
    return true
}

// Mark - Test
let pairs = [["apple", "papel"], ["carrot", "tarroc"], ["hello", "llloh"]]
for pair in pairs {
    let word1 = pair[0];
    let word2 = pair[1];
//    let anagram = CheckPermutationA(word1, word2)
    let anagram = CheckPermutationB(word1, word2)
    print("\(word1), \(word2): \(anagram)")
}
