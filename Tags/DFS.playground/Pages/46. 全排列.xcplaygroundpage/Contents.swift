/**
 https://leetcode.cn/problems/permutations/
 */
/**
 给定一个不含重复数字的数组 nums ，返回其 所有可能的全排列 。你可以 按任意顺序 返回答案。
 示例 1：
 输入：nums = [1,2,3]
 输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 示例 2：
 输入：nums = [0,1]
 输出：[[0,1],[1,0]]
 示例 3：
 输入：nums = [1]
 输出：[[1]]
 提示：
 1 <= nums.length <= 6
 -10 <= nums[i] <= 10
 nums 中的所有整数 互不相同
 */
class Solution {
    private var lists: [[Int]] = []
    private var numbers: [Int] = []
    /// 用来保存每一层选择的数字
    private var results: [Int] = []
    /// 用来标记nums中的数字是否被使用过了
    private var useds: [Bool] = []
    
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 { return lists }
        numbers = nums
        dfs(0)
        return lists
    }
    
    func dfs(_ index: Int) {
        // 不能再往下搜索
        if index == numbers.count {
            var resultList = [Int]()
            for value in results {
                resultList.append(value)
            }
            lists.append(resultList)
            return
        }
        
        // 枚举这一层所有可以做出的选择
        for i in 0..<numbers.count {
            if useds[i] { continue }
            results[index] = numbers[i]
            useds[i] = true
            
            dfs(index + 1)
            // 还原现场
            useds[i] = false
        }
    }
}

class Solution1 {
    func permute(_ nums: [Int]) -> [[Int]] {
        return [[Int]]()
    }
}

class Solution2 {
    func permute(_ nums: [Int]) -> [[Int]] {
        return [[Int]]()
    }
}
