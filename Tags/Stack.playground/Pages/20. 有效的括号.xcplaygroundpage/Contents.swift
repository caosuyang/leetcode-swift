/**
 * https://leetcode.cn/problems/valid-parentheses/description/
 * @author csy
 *
 */

// MARK: - Solution
/**
 * 栈
 * 时间复杂度：O(n)
 * 空间复杂度：O(n)
 * @param s
 * @return
 */
func isValid(_ s: String) -> Bool {
    var map = [Character:Character]()
    map["("] = ")"
    map["["] = "]"
    map["{"] = "}"
    var stack = [Character]();
    for c in s {
        let has = map.contains { k, v in
            k == c
        }
        if has { // 左括号
            stack.append(c)
        } else { // 右括号
            if stack.isEmpty {
                return false
            }
            let r = map[stack.removeLast()]
            if c != r {
                return false
            }
        }
    }
    return stack.isEmpty;
}

/**
 * 栈
 * map优化
 * 时间复杂度：O(n)
 * 空间复杂度：O(n)
 * @param s
 * @return
 */
func isValid(_ s: String) -> Bool {
    var stack = [Character]();
    for c in s {
        if c == "(" || c == "[" || c == "{" { // 左括号
            stack.append(c)
        } else { // 右括号
            if stack.isEmpty {
                return false
            }
            let l = stack.removeLast()
            if l == "(" && c != ")" {
                return false
            }
            if l == "[" && c != "]" {
                return false
            }
            if l == "{" && c != "}" {
                return false
            }
        }
    }
    return stack.isEmpty;
}

/**
 * 字符替换
 * 时间复杂度：O(n)
 * 空间复杂度：O(n)
 * @param s
 * @return
 */
func isValid(_ s: String) -> Bool {
    var str = s
    while str.contains("()") || str.contains("[]") || str.contains("{}") {
        str = str.replacingOccurrences(of: "()", with: "")
        str = str.replacingOccurrences(of: "[]", with: "")
        str = str.replacingOccurrences(of: "{}", with: "")
    }
    return str.isEmpty;
}
