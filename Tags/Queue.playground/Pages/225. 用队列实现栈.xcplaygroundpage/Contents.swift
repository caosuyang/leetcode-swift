/**
 * https://leetcode.cn/problems/implement-stack-using-queues/description/
 * @author csy
 *
 */

// MARK: - Solution
/**
 * 两个队列
 */
class MyQueue {
    /**
     * 队列
     * 空间复杂度：O(n)
     */
    var outQueue: [Int] // 用于存储栈内元素
    var inQueue: [Int]  // 作为入栈操作辅助队列
    
    /**
     * 构造函数
     */
    init() {
        outQueue = [Int]()
        inQueue = [Int]()
    }
    
    /**
     * 将元素 x 压入栈顶
     * 时间复杂度：O(n)
     * @param x
     */
    func push(_ x: Int) {
        // 1.首先将元素入队到inQueue
        inQueue.append(x)
        // 2.然后将outQueue所有元素出队，入队到inQueue
        while outQueue.isEmpty == false {
            let f = outQueue.removeFirst()
            inQueue.append(f)
        }
        // 3.再将outQueue和inQueue互换
        let tmpQueue = outQueue
        outQueue = inQueue
        inQueue = tmpQueue
    }
    
    /**
     * 移除并返回栈顶元素
     * 时间复杂度：O(1)
     * @return
     */
    func pop() -> Int {
        return outQueue.removeFirst()
    }
    
    /**
     * 返回栈顶元素
     * 时间复杂度：O(1)
     * @return
     */
    func top() -> Int {
        return outQueue.first ?? 0
    }
    
    /**
     * 如果栈是空的，返回 true ；否则，返回 false
     * 时间复杂度：O(1)
     * @return
     */
    func empty() -> Bool {
        return outQueue.isEmpty
    }
}

/**
 * 一个队列
 */
class MyQueue2 {
    /**
     * 队列
     * 空间复杂度：O(n)
     */
    var queue: [Int]
    
    /**
     * 构造函数
     */
    init() {
        queue = [Int]()
    }
    
    /**
     * 将元素 x 压入栈顶
     * 时间复杂度：O(n)
     * @param x
     */
    func push(_ x: Int) {
        // 1.首先获取入栈前queue元素数量
        var size = queue.count
        // 2.然后将元素入队到queue
        queue.append(x)
        // 2.然后将queue前size个元素出队，入队到queue
        while size > 0 {
            size -= 1
            let f = queue.removeFirst()
            queue.append(f)
        }
    }
    
    /**
     * 移除并返回栈顶元素
     * 时间复杂度：O(1)
     * @return
     */
    func pop() -> Int {
        return queue.removeFirst()
    }
    
    /**
     * 返回栈顶元素
     * 时间复杂度：O(1)
     * @return
     */
    func top() -> Int {
        return queue.first ?? 0
    }
    
    /**
     * 如果栈是空的，返回 true ；否则，返回 false
     * 时间复杂度：O(1)
     * @return
     */
    func empty() -> Bool {
        return queue.isEmpty
    }
}
/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
