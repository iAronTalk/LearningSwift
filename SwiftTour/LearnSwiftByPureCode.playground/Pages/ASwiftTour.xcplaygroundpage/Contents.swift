//: Playground - noun: a place where people can play

import UIKit

//1.
print("Hello, world") /* yeah，终于不用再写蹩脚的‘@’和‘;’了*/

//2.Simple Value(简单值)
var myVarible = 27 // 默认类型为Int
let myConstant = "男" // 默认类型为String

var myGender: String = "Male" //制定类型为String

/*通过\(...)的方式在字符串中插入数值等其他数据类型*/
let introduction = "I am \(27) years old,and I am a \(myGender) developer from China"

let introduction2 = "I am" + String(myVarible)  //或者通过这种方式完成上面的操作

let quotation = ""
                "多行展示"
                ""//swift 4.0 特性
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
            print(kind)
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
    print(optionalName)
}

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)" // ??判断nickName是否为空，如果为空添加一个默认值。
    //3.3 while 和 repeat-while，同C中while 和 do-while, 但是判断条件无需加（）

    //3.4 Switch  无耻copy官方代码，有些C基础的同学应该看着并不费劲，后面会详细讲解
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}
//4.FunctionAndClosure（函数与闭包）这里先感受下函数和闭包，大概记住样式，后面详细介绍
/*1.func开头，2.greet函数名，3.person、condition（函数类型，即函数可以作为参数传递） 参数名，-> String 指定返回值*/
func conditon(number: Int) -> Bool {
    if number != 0 {
        return true
    }else {
        return false
    }
}
func greet(person: String, condition: (Int) -> Bool) -> String {
    return "Hello \(person)"
}
greet(person: "Bob", condition:conditon)
/* 闭包没有func，没有参数名，没有函数名，只有函数表达式(number: Int) -> Int，in 后面为执行代码*/
var numbers = [1, 2, 3]

numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
    })

//5.关于Class，Struct，Enum，Protocol，Extension，Generic等等是swift中非常重要切繁杂的知识，限于篇幅这里就不做介绍了，后续的笔记会详细介绍这部分知识。






