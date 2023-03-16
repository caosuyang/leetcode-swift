//
//  HeapSort1.swift
//  leetcode-demo
//
//  Created by csy on 2023/3/16.
//

import Foundation
/**
 * 堆排序（Heap Sort）
 * 方法一：两层遍历+使用堆来选择最大值
 * 912. 排序数组
 * https://leetcode.cn/problems/sort-an-array/
 * @author csy
 *
 */
class HeapSort1 {
    /**
     * 两层遍历+使用堆来选择最大值
     * 最坏、平均、最优时间复杂度，扫描一遍元素*每次对0位置下滤操作 O(nlogn)
     * 空间复杂度 O(1)，没有额外堆空间和递归调用
     * 属于不稳定的排序算法，将堆顶元素与最后一个元素交换，会把相同最大两个元素位置顺序打乱
     * 属于原地算法，没有依赖外部资源，只对传入参数nums进行修改和覆盖
     * @param nums
     * @return
     */
    func sortArray(_ nums: [Int]) -> [Int] {
        var nums1 = nums
        var size = nums1.count
        // 对序列进行原地建堆
        heapify(size, nums1)
        // 如果堆内只剩一个元素，就不再需要进行交换
        while size > 1 {
            // 交换堆顶元素和最后一个元素的位置
            let tmp = nums1[size - 1]
            nums1[size - 1] = nums1[0]
            nums1[0] = tmp
            
            // 堆的size减1
            size -= 1
            
            // 对堆0位置元素进行下滤
            shiftDown(0, nums1, size)
        }
        
        return nums1
    }
    
    /**
     * 对序列进行原地建堆
     * @param size
     */
    private func heapify(_ size: Int, _ nums: [Int]) {
        // 自下而上的下滤
        var i = (size >> 1) - 1
        while i >= 0 {
            shiftDown(i, nums, size)
            i -= 1
        }
    }
    
    /**
     * 让index位置的元素下滤
     * @param index
     */
    private func shiftDown(_ index: Int, _ nums: [Int], _ size: Int) {
        var index1 = index
        var nums1 = nums
        let element = nums1[index1]
        let half = size >> 1
        // 第一个叶子节点的索引 == 非叶子节点的数量
        // index < 第一个叶子节点的索引
        // 必须保证index位置是非叶子节点
        while index1 < half {
            // index的节点有2种情况
            // 1.只有左子节点
            // 2.同时有左右子节点
            
            // 默认为左子节点跟它进行比较
            var childIndex = (index1 << 1) + 1
            var child = nums1[childIndex]
            
            // 右子节点
            let rightIndex = childIndex + 1
            
            // 选出左右子节点最大的那个
            if rightIndex < size && nums1[rightIndex] > child {
                childIndex = rightIndex
                child = nums1[childIndex]
            }
            
            if element >= child { break }
            
            // 将子节点存放到index位置
            nums1[index1] = child
            
            // 重新设置index
            index1 = childIndex
        }
        nums1[index1] = element
    }
}

/**
 * 912. 排序数组
 * 给你一个整数数组 nums，请你将该数组升序排列。
 * 示例 1：
 * 输入：nums = [5,2,3,1]
 * 输出：[1,2,3,5]
 * 示例 2：
 * 输入：nums = [5,1,1,2,0,0]
 * 输出：[0,0,1,1,2,5]
 * 提示：
 * 1 <= nums.length <= 5 * 104
 * -5 * 104 <= nums[i] <= 5 * 104
 * @param args
 * leetcode执行结果：2 / 20 个通过的测试用例，解答错误
 */
//var array = [5, 1, 1, 2, 0, 0]
//array = sortArray(array)
//for i in array {
//    print(i)
//}
