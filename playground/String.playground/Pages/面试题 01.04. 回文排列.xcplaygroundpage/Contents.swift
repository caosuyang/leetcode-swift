//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

/**
 * https://leetcode-cn.com/problems/palindrome-permutation-lcci/
 * @author csy
 *
 */

/**
 * A.哈希表
 * @param s
 * @return
 */
func canPermutePalindrome(_ s: String) -> Bool {
    let str = s.uppercased()
    var map: [Character: Int] = [:]
    for c in str {
        if map.keys.contains(c) {
            var v = map[c] ?? 1
            v += 1
            map[c] = v;
        } else {
            map[c] = 1;
        }
    }
    print(map)
    
    let values = map.values
    var count = 0
    for value in values {
        if value % 2 != 0 {
            count += 1
        }
    }
    if count > 1 {
        return false
    }
    return true
}


// Mark - Test
//let pali = "Rats live on no evil star"
let pali = "AaBb//a"
print(canPermutePalindrome(pali))
