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
 * @param astr
 * @return
 */
func isUniqueA(_ astr: String) -> Bool {
    
    return true
}

/**
 * B.排序法
 * @param astr
 * @return
 */
func isUniqueB(_ astr: String) -> Bool {
    
    return true
}

/**
 * C.Set去重
 * @param astr
 * @return
 */
func isUniqueC(_ astr: String) -> Bool {
    
    return true
}

/**
 * D.哈希表
 * @param astr
 * @return
 */
func isUniqueD(_ astr: String) -> Bool {
    
    return true
}

/**
 * E.位运算
 * @param astr
 * @return
 */
func isUniqueE(_ astr: String) -> Bool {
    
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
