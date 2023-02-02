//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

/**
 * https://leetcode-cn.com/problems/string-to-url-lcci/
 * @author csy
 *
 */

/**
 * A.一次遍历，字符串拼接
 * @param S
 * @param length
 * @return
 */
func replaceSpaces(_ S: String, _ length: Int) -> String {
    var str = ""
    var count = 0
    for ele in S {
        if ele == " " {
            // %20
            str.append("%20")
        } else {
            str.append(ele)
        }
        count += 1
        if count == length {
            break
        }
    }
    return str
}


// Mark - Test
let str = "Mr John Smith    "
let length = 13;
print(replaceSpaces(str, length))
