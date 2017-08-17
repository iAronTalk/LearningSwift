# 纯代码学习Swift - 初识swift

#### 写在前面：

> 学习swift有一段时间了，纯属业余爱好，工作尚未涉及到这方面的工作，但国外swift的社区活跃异常，著名的Tutorial大厂[Raywenderlich](https://www.raywenderlich.com/) 已经几乎全部切到了swift上，Stackoverflow上关于iOS的问题基本也都是面向Swift。关于是否要开始学习Swift，可以参考下面几个链接，自己决定吧...

> 利用业余时间捧着官方的《The Swift Programming Language》读了几遍，也跟着写了一些demo，但在读开源源码的时候还会有一些用法或者关键字搞得不是特别清楚，度娘上找了半天教程大多过于基础或者“废话”连篇没有重点，于是有了这个系列想法，但一直没有想好要怎么写，是写给读者还是什么，想不出，于是权当学习笔记，如果恰巧你也看到这里，希望对你有所帮助。

> ##### 系列宗旨
- 用代码学习，而不是一堆废话。
- 争取覆盖swift更多的内容，突出重点。
- 一个例子讲更多的语法。

#### 观望，上车？自己决定吧。  

 - *[Swift 再等等？我的答案是：快上车](www.jianshu.com/p/2452cb269ae2)*

 - *[主力 Swift 或许真的要等一等](https://zhuanlan.zhihu.com/p/25428167)*

 - *[无论你是否主力 Swift, 这些事情你都可以了解一下](http://www.cocoachina.com/swift/20170307/18839.html)*

***

#### 开始正文 - 初识swift
```
//1.
print("Hello, world") /* yeah，终于不用再写蹩脚的‘@’和‘;’了*/

//2.Simple Value(简单值)
var myVarible = 27 // 默认类型为Int
let myConstant = "男" // 默认类型为String

var myGender: String = "Male" //制定类型为String

/*通过\(...)的方式在字符串中插入数值等其他数据类型*/
let introduction = "I am \(27) years old,and I am a \(myGender) developer from China"

let introduction2 = "I am" + String(myVarible)  //或者通过这种方式完成上面的操作

let quotation = """
                多行展示
                """//swift 4.0 特性
//[] 表示数组和字典
var shoppingList = ["apple", "water", "juice"]
shoppingList[1] = "pure water" //这里，如果用let申明shoppingList 会报错。
print(shoppingList)

var personInfo = ["name":"aaron",
                  "gender":"male"]
personInfo["address"] = "Beijing"
print(personInfo)

var emptyArr = [String]() //或者不指定类型 var emptyArr = []
var emptyDic = [String: Double]() //同上，var emptyDic = [:]

//3.Control Flow 条件语句
    //3.1 for-in
let interestingNumbers = [
    "Aaron": [2, 3, 5, 7, 11, 13],
    "David": [1, 1, 2, 3, 5, 8],
]
var largest = 0

//swift新特性tuple，（）内为一个整体，可以用于传递数据，//每次for循环kind为字典的key，numbers为value。
for (kind, numbers) in interestingNumbers {
    for number in numbers {//用法通OC中for-in
        if number > largest {
            largest = number
        }
    }
}
print(largest)

var total = 0
for i in 0..<4 { //这里为i>=0,<4,如果要等于4那么应该写作0...4
    total += i
}
print(total)

    //3.2 Optional(可选值)
var optionalName: String? = "Aaron" //告诉系统optionalName可能为nil，对改制使用时候要留心处理。

//optionalName = nil //如果optionalName为nil，那么下面的if判断会输出"This guy doesnot have a name"。
if let optionalName = optionalName {
    print("This guy doesnot have a name")
}

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)" // ??判断nickName是否为空，如果为空添加一个默认值。
    //3.3 while 和 repeat-while，同C中while 和 do-while, 但是判断条件无需加（）
```
