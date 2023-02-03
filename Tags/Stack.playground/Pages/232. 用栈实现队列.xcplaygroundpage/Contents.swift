/**
 * https://leetcode.cn/problems/implement-queue-using-stacks/description/
 * @author csy
 *
 */

// MARK: - Solution
/**
 * 两个栈
 */
class MyQueue {
    /**
     * 栈
     */
    var inStack: [Int]
    var outStack: [Int]
    
    /**
     * 实例化
     */
    init() {
        inStack = [Int]()
        outStack = [Int]()
    }

    /**
     * 将元素 x 推到队列的末尾
     * @param x
     */
    func push(_ x: Int) {
        inStack.append(x)
    }
    
    /**
     * 从队列的开头移除并返回元素
     * @return
     */
    func pop() -> Int {
        checkOutStack()
        return outStack.removeLast();
    }
    
    /**
     * 返回队列开头的元素
     * @return
     */
    func peek() -> Int {
        checkOutStack()
        return outStack.last ?? 0
    }
    
    /**
     * 如果队列为空，返回 true ；否则，返回 false
     * @return
     */
    func empty() -> Bool {
        return inStack.isEmpty && outStack.isEmpty
    }
    
    private func checkOutStack() {
        if outStack.isEmpty {
            while inStack.isEmpty == false {
                outStack.append(inStack.removeLast())
            }
        }
    }
}
/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
