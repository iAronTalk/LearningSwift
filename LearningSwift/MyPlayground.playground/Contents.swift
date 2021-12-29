import UIKit

var greeting = "Hello, playground"

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
}

class Solution {
    func reverseList2(_ head: ListNode?) -> ListNode? {
        guard let safeHead = head else {
            return nil
        }
        var pre: ListNode? = nil
        var cur: ListNode? = safeHead;
        var curNext: ListNode? = nil;
        while cur != nil {
            curNext = cur!.next
            cur!.next = pre
            pre = cur
            cur = curNext
        }
        return pre
    }
    func reverseList(_ head: ListNode?) -> ListNode? {
        
        if head == nil || head?.next == nil {
            return head
        }
        let newhead = reverseList(head!.next)
        head!.next!.next = newhead
        head!.next = nil
        return newhead
    }
    func swapPairs2(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let newHead = head!.next!;
        head!.next = swapPairs2(newHead.next)
        newHead.next = head
        return newHead
    }
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let safeHead = head else {
            return nil
        }
        let dummyNode = ListNode.init(0, safeHead)
        var temp: ListNode? = dummyNode
        while temp?.next != nil && temp?.next?.next != nil {
            let node1 = temp!.next!
            let node2 = temp!.next!.next!
            temp?.next = node2
            node1.next = node2.next
            node2.next = node1
            temp = node1
        }
        return dummyNode.next
    }
    func hasCycle1(_ head: ListNode?) -> Bool {
        guard let safeHead = head else { return false }
        var seen: [ListNode] = []
        var temp: ListNode? = safeHead
        while temp != nil {
            for node in seen { // 这个地方这么写也是迫不得已，swift无法直接contains class
                if node === temp {
                    return true
                }
            }
            seen.append(temp!)
            temp = temp!.next
        }
        return false
    }
    func hasCycle(_ head: ListNode?) -> Bool {  // 说来说去还是这种好。
        if head == nil || head?.next == nil {
            return false
        }
        var slow: ListNode? = head
        var fast: ListNode? = head!.next
        while slow !== fast {
            if slow == nil || fast == nil {
                return false
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return true
    }
    
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard let safeHead = head else { return nil }
        var inter = findInterection(safeHead)
        if inter == nil {
            return nil
        }
        var p: ListNode? = safeHead
        while inter !== p {
            inter = inter?.next
            p = p?.next
        }
        return inter
    }
    
    func findInterection(_ head: ListNode?) -> ListNode? {
        if head == nil && head?.next == nil {
            return nil
        }
        var slow: ListNode? = head
        var fast: ListNode? = head
        var swoopin = true
        while fast !== slow || swoopin {
            swoopin = false
            if fast == nil || slow == nil {
                return nil
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    
    func isValid(_ s: String) -> Bool {
        var n = s.count
        n = n % 2
        if n == 1 {
            return false
        }
        var stack: [Character] = []
        let map: [Character: Character] = [")": "(", "}": "{", "]": "["]
        for c in s {
            if map.values.contains(c) {
                stack.append(c)
            } else if (stack.isEmpty || map[c] != stack.popLast()) {
                return false
            }
        }
        return stack.isEmpty
    }
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack = [Int]()
        var res = Array.init(repeating: 0, count: temperatures.count)
        for (i, temperature) in temperatures.enumerated() {
            while !stack.isEmpty && temperatures[stack.last!] < temperature {
                let idx = stack.removeLast()
                res[idx] = i - idx
            }
            stack.append(i)
        }
        return res
    }
    
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var stack = [Int]()
        var hashmap: [Int: Int] = Dictionary()
        var res = [Int]()
        for num2 in nums2 {
            while !stack.isEmpty && stack.last! <= num2 {
                let removed = stack.removeLast()
                hashmap[removed] = num2
            }
            stack.append(num2)
        }
        for leftNum in stack {
            hashmap[leftNum] = -1
        }
        for num1 in nums1 {
            res.append(hashmap[num1]!)
        }
        return res
    }
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count == 0 {
            return []
        }
        var window: [Int] = [] // 存储的下标
        var res: [Int] = []
        for (i, num) in nums.enumerated() {
            if !window.isEmpty && window.first! <= i - k {
                window.removeFirst()
            }
            while !window.isEmpty && nums[window.last!] <= num {
                window.removeLast()
            }
            
            window.append(i)
            if !window.isEmpty && i >= k - 1 {
                res.append(nums[window.first!])
            }
        }
        return res
    }
    
}

let node1 = ListNode.init(3, nil)
let node2 = ListNode.init(2, nil)
let node3 = ListNode.init(0, nil)
let node4 = ListNode.init(4, nil)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node2

let solution2 = Solution()
let detectedNode = solution2.detectCycle(node1)
//print(detectedNode?.val)
let dailyTRes = solution2.dailyTemperatures([73,74,75,71,69,72,76,73])
print(dailyTRes)
let nextGreater = solution2.nextGreaterElement([4,1,2], [1,3,4,2])
print(nextGreater)

class MinStack {

    var internalArr: [Int] = []
    var minVal: [Int] = []
    init() {

    }
    
    func push(_ val: Int) {
        internalArr.append(val)
    }
    
    func pop() {
        internalArr.popLast()
    }
    
    func top() -> Int {
        return internalArr.last!
    }
    
    func getMin() -> Int {
        minVal = internalArr.sorted() { $0 > $1 }
        return minVal.last!
    }
}

class MyQueue {

    var input: [Int] = []
    var output: [Int] = []
    init() {
    }
    
    func push(_ x: Int) {
        input.append(x)
    }
    
    func pop() -> Int {
        peek()
        return output.removeLast()
    }
    
    func peek() -> Int {
        if output.isEmpty {
            while !input.isEmpty {
                output.append(input.removeLast())
            }
        }
        
        return output.last!
    }
    
    func empty() -> Bool {
        return output.isEmpty && input.isEmpty
    }
}

class MyStack {
    var input: [Int] = []
    var temp: [Int] = []
    var lastObj: Int = Int.min
    init() {
    }
    
    func push(_ x: Int) {
        input.append(x)
        lastObj = x
    }
    
    func pop() -> Int {
        if input.isEmpty {
            return Int.min
        }
        if input.count == 1 {
            lastObj = Int.min
            return input.removeFirst()
        }
        for _ in 0..<input.count - 1 {
            temp.append(input.removeFirst())
        }
        let last = input.removeFirst()
        for (i, item) in temp.enumerated() {
            input.append(item)
            if i == (temp.count - 1) {
                lastObj = item
            }
        }
        temp.removeAll()
        return last
    }
    
    func top() -> Int {
        return lastObj
    }
    
    func empty() -> Bool {
        return input.isEmpty
    }
}

