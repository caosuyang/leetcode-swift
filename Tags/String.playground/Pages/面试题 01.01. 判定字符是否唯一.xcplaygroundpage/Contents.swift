//: [Previous](@previous)

import Foundation
import CoreFoundation

var greeting = "Hello, playground"

//: [Next](@next)


/**
 * https://leetcode-cn.com/problems/is-unique-lcci/
 * @author csy
 *
 */

// Mark - Solution
/**
 * A.暴力法
 * 遍历字符串，每次遍历去除首字母，然后查询剩余字符串里是否有去除掉的这个首字母
 * @param astr
 * @return
 */
func isUniqueA(_ astr: String) -> Bool {
    if astr.count > 128 {
        return false
    }
    var s = astr
    for subS in s {
        s.removeFirst()
        if s.contains(subS) {
            return false
        }
    }
    return true
}

/**
 * B.排序法
 * @param astr
 * @return
 */
func isUniqueB(_ astr: String) -> Bool {
    if astr.count > 128 {
        return false
    }
    let s = astr.sorted()
    var pre = ""
    for subS in s {
        if String(subS) == pre {
            return false
        }
        pre = String(subS)
    }
    return true
}

/**
 * C.Set去重
 * 利用Set是无序无重复数据的集和，去掉String中重复的元素。与原字符串长度对比。
 * @param astr
 * @return
 */
func isUniqueC(_ astr: String) -> Bool {
    if astr.count > 128 {
        return false
    }
    let s = Set(astr)
    return s.count == astr.count
}

/**
 * D.哈希表
 * @param astr
 * @return
 */
func isUniqueD(_ astr: String) -> Bool {
    if astr.count > 128 {
        return false
    }
    var map: [Character: Int] = [:]
    let strs = Array(astr)
    for (index, value) in strs.enumerated() {
        if (map[value] != nil) {
            return false
        }
        map[value] = index
    }
    return true
}

/**
 * E.位运算
 * @param astr
 * @return
 */
func isUniqueE(_ astr: String) -> Bool {
    if astr.count > 26 {
        return false
    }
    var checker = 0
    for char in astr {
        let a: String.Element = "a"
        let moveBit = (char.asciiValue ?? 0) - (a.asciiValue ?? 0)
        if (checker & (1 << moveBit)) > 0 {
            return false
        }
        checker |= (1 << moveBit)
    }
    return true
}


// Mark - Test
//let words = ["leetcode", "abc"]
////let words = ["abcde", "hello", "apple", "kite", "padle"]
//for word in words {
//    print("\(word): \(isUniqueA(word))")
//}

// Mark - Tester
let words = ["abcde", "hello", "apple", "kite", "padle"]
for word in words {
    let wordA = isUniqueA(word)
    let wordB = isUniqueB(word)
    if wordA == wordB {
        print("\(word): \(wordA)")
    } else {
        print("\(word): \(wordA) vs \(wordB)")
    }
}
