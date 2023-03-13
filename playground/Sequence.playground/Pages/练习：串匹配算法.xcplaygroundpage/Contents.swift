/**
 查找一个模式串（pattern）在文本串（text）中的位置
 tlen 代表文本串 text 的长度，plen 代表模式串 pattern 的长度
 */

/**
 方法一：蛮力1
 */
class Solution {
    func indexOf(_ text: String, _ pattern: String) -> Int {
        let tlen = text.count
        let plen = pattern.count
        if tlen == 0 || plen == 0 || tlen < plen {
            return -1
        }
        var pi = 0, ti = 0
        while pi < plen && ti < tlen {
            // 'subscript(_:)' is unavailable: cannot subscript String with an Int, use a String.Index instead.
            let tindex = text.index(text.startIndex, offsetBy: ti)
            let pindex = text.index(pattern.startIndex, offsetBy: pi)
            if text[tindex] == pattern[pindex] {
                ti += 1
                pi += 1
            } else {
                ti -= (pi - 1)
                pi = 0
            }
        }
        return pi == plen ? ti - pi : -1
    }
}

/**
 方法二：蛮力1-优化
 在恰当的时候可以提前退出，减少比较次数
 ti末尾有些事完全没必要的比较，推出条件可以提前
 */
class Solution2 {
    func indexOf(_ text: String, _ pattern: String) -> Int {
        let tlen = text.count
        let plen = pattern.count
        if tlen == 0 || plen == 0 || tlen < plen {
            return -1
        }
        var pi = 0, ti = 0
        let tmax = tlen - plen
        // ti < tlen -> ti - pi <= tmax
        // ti - pi 指的是每一轮比较中 text 首个比较字符的位置
        while pi < plen && ti - pi <= tmax {
            // 'subscript(_:)' is unavailable: cannot subscript String with an Int, use a String.Index instead.
            let tindex = text.index(text.startIndex, offsetBy: ti)
            let pindex = text.index(pattern.startIndex, offsetBy: pi)
            if text[tindex] == pattern[pindex] {
                ti += 1
                pi += 1
            } else {
                ti -= (pi - 1)
                pi = 0
            }
        }
        return pi == plen ? ti - pi : -1
    }
}

/**
 方法三：蛮力2
 两层for循环
 最好时间复杂度 m
 最坏时间复杂度 mn
 */
class Solution3 {
    func indexOf(_ text: String, _ pattern: String) -> Int {
        let tlen = text.count
        let plen = pattern.count
        if tlen == 0 || plen == 0 || tlen < plen {
            return -1
        }
        let tmax = tlen - plen
        // 两层for循环
        for ti in 0...tmax {
            var pi = 0
            for index in 0..<plen {
                pi = index
                let tindex = text.index(text.startIndex, offsetBy: ti + pi)
                let pindex = text.index(pattern.startIndex, offsetBy: pi)
                if text[tindex] != pattern[pindex] {
                    break
                }
            }
            if pi == plen {
                return ti
            }
        }
        return -1
    }
}

/**
 方法四：KMP
 kmp充分利用此前比较过的内容，可以跳过一些不必要的比较位置
 */
class Solution4 {
    func indexOf(_ text: String, _ pattern: String) -> Int {
        return 0
    }
}

/**
 方法五：KMP - next表优化
 */
class Solution5 {
    func indexOf(_ text: String, _ pattern: String) -> Int {
        return 0
    }
}

