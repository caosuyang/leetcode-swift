/**
 * 26. 删除有序数组中的重复项 
 * https://leetcode.cn/problems/remove-duplicates-from-sorted-array/
 * @author csy
 */

/**
* 方法一：暴力枚举
* 时间复杂度O(n)，n是数组的长度，遍历一次
* 空间复杂度O(n)，n是数组的长度，使用长度为n的数组额外空间
*/
func removeDuplicates(_ nums: inout [Int]) -> Int {
    var newNums = [Int]()
    newNums.append(nums[0])
    for i in 1..<nums.count {
        if nums[i] > nums[i - 1] {
            newNums.append(nums[i])
        }
    }
    nums = newNums
    return nums.count
}

/**
* 方法二：双指针
* 时间复杂度O(n)，n是数组长度，快慢指针最多各移动n次
* 空间复杂度O(1)，使用常数额外空间
*/
func removeDuplicates2(_ nums: inout [Int]) -> Int {
    let len = nums.count
    if len < 2 { return len }

    var slow = 1
    for fast in 1..<len {
        if nums[fast] != nums[fast - 1] {
            nums[slow] = nums[fast]
            slow = slow + 1
        }
    }
    return slow
}

/**
* 方法三：双指针
* 时间复杂度O(n)，n是数组长度，快慢指针最多各移动n次
* 空间复杂度O(1)，使用常数额外空间
*/
func removeDuplicates3(_ nums: inout [Int]) -> Int {
    let len = nums.count
    if len < 2 { return len }
    
    var fast = 1, slow = 1
    while fast < len {
        if nums[fast] != nums[fast - 1] {
            nums[slow] = nums[fast]
            slow = slow + 1
        }
        fast = fast + 1
    }
    return slow
}

/**
 测试用例
 */
var nums1 = [1,1,2]
let output1 = 2

var nums2 = [0,0,1,1,1,2,2,3,3,4]
let output2 = 5

/**
 执行结果
 */
print("removeDuplicates")
print(removeDuplicates(&nums1))
print(removeDuplicates(&nums2))
print(nums1)
print(nums2)
assert(removeDuplicates(&nums1) == output1)
assert(removeDuplicates(&nums2) == output2)

print("removeDuplicates2")
nums1 = [1,1,2]
nums2 = [0,0,1,1,1,2,2,3,3,4]
print(removeDuplicates2(&nums1))
print(removeDuplicates2(&nums2))
print(nums1)
print(nums2)
assert(removeDuplicates2(&nums1) == output1)
assert(removeDuplicates2(&nums2) == output2)

print("removeDuplicates3")
nums1 = [1,1,2]
nums2 = [0,0,1,1,1,2,2,3,3,4]
print(removeDuplicates3(&nums1))
print(removeDuplicates3(&nums2))
print(nums1)
print(nums2)
assert(removeDuplicates3(&nums1) == output1)
assert(removeDuplicates3(&nums2) == output2)

/**
 控制台打印
 */
/**
 removeDuplicates
 2
 5
 [1, 2]
 [0, 1, 2, 3, 4]
 removeDuplicates2
 2
 5
 [1, 2, 2]
 [0, 1, 2, 3, 4, 2, 2, 3, 3, 4]
 __lldb_expr_1/26. 删除有序数组中的重复项 .playground:91: Assertion failed
 Playground execution failed:

 error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).
 The process has been left at the point where it was interrupted, use "thread return -x" to return to the state before expression evaluation.

 * thread #1, queue = 'com.apple.main-thread', stop reason = EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0)
   * frame #0: 0x00007ff80d700e3e libswiftCore.dylib`Swift._assertionFailure(_: Swift.StaticString, _: Swift.String, file: Swift.StaticString, line: Swift.UInt, flags: Swift.UInt32) -> Swift.Never + 798
     frame #1: 0x0000000101dc61d0 $__lldb_expr2`main at <unknown>:0
     frame #2: 0x0000000101a60560 26. Âà†Èô§ÊúâÂ∫èÊï∞ÁªÑ‰∏≠ÁöÑÈáçÂ§çÈ°π `linkResources + 256
     frame #3: 0x00007ff800386e29 CoreFoundation`__CFRUNLOOP_IS_CALLING_OUT_TO_A_BLOCK__ + 12
     frame #4: 0x00007ff8003865e2 CoreFoundation`__CFRunLoopDoBlocks + 406
     frame #5: 0x00007ff800381378 CoreFoundation`__CFRunLoopRun + 2212
     frame #6: 0x00007ff8003806f7 CoreFoundation`CFRunLoopRunSpecific + 560
     frame #7: 0x00007ff809c5c28a GraphicsServices`GSEventRunModal + 139
     frame #8: 0x0000000108fae62b UIKitCore`-[UIApplication _run] + 994
     frame #9: 0x0000000108fb3547 UIKitCore`UIApplicationMain + 123
     frame #10: 0x0000000101a606c5 26. Âà†Èô§ÊúâÂ∫èÊï∞ÁªÑ‰∏≠ÁöÑÈáçÂ§çÈ°π `main + 357
     frame #11: 0x0000000101be82bf dyld_sim`start_sim + 10
     frame #12: 0x00000001107b241f dyld`start + 1903
 */
