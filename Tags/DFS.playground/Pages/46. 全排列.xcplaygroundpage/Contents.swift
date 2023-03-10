/**
 回溯
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
/**
 方法一：执行出错 0 / 26 个通过的测试用例
 process exited with signal SIGILL
 */
class Solution {
    private var list = [[Int]]()
    private var nums1 = [Int]()
    /// 用来保存每一层选择的数字
    private var result = [Int]()
    /// 用来标记nums中的数字是否被使用过了
    private var used = [Bool]()
    
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 { return list }
        nums1 = nums
        dfs(0)
        return list
    }
    
    func dfs(_ idx: Int) {
        // 不能再往下搜索
        if idx == nums1.count {
            var resultList = [Int]()
            for value in result {
                resultList.append(value)
            }
            list.append(resultList)
            return
        }
        
        // 枚举这一层所有可以做出的选择
        for i in 0..<nums1.count {
            if used[i] { continue }
            result[idx] = nums1[i]
            used[i] = true
            
            dfs(idx + 1)
            
            // 还原现场
            used[i] = false
        }
    }
}

/**
 方法二：通过
 */
class Solution2 {
    private var list = [[Int]]()
    private var nums1 = [Int]()
    /// 用来保存每一层选择的数字
    private var result = [Int]()
    
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 { return list }
        nums1 = nums
        dfs(0)
        return list
    }
    
    func dfs(_ idx: Int) {
        // 不能再往下搜索
        if idx == nums1.count {
            list.append(result)
            return
        }
        
        // 枚举这一层所有可以做出的选择
        for num in nums1 {
            if result.contains(num) { continue }
            
            result.append(num)
            
            dfs(idx + 1)
            
            result.remove(at: result.count - 1)
        }
    }
}

/**
 方法三：通过
 */
class Solution3 {
    func permute(_ nums: [Int]) -> [[Int]] {
        var list = [[Int]]()
        if nums.count == 0 { return list }
        var nums1 = nums
        dfs(0, &nums1, &list)
        return list
    }
    
    func dfs(_ idx: Int, _ nums: inout [Int], _ list: inout [[Int]]) {
        // 不能再往下搜索
        if idx == nums.count {
            var result = [Int]()
            for value in nums {
                result.append(value)
            }
            list.append(result)
            return
        }
        
        // 枚举这一层所有可以做出的选择
        for i in idx..<nums.count {
            swap(&nums, idx, i)
            dfs(idx + 1, &nums, &list)
            swap(&nums, idx, i)
        }
    }
    
    func swap(_ nums: inout [Int], _ i: Int, _ j: Int) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }
}
