//: [Previous](@previous)

import Foundation

/*控制流，即for循环，while，if-else 等*/
//0.写在前面，for循环在swift中不在适应，代替它的是for-in，while与C语言中的while用法一直，repeat-while与C语言中do-while用法一直。
//其中switch用法相对于C中的用法更加灵活，增加非常多的特性，这个swift中的Enum丰富了C中的Enum有关。

//1.for-in
//1.1 普通的for-in 与OC中没有差异
//1.2 迭代元组（a,b）的for-in 前面ASwiftTour一节有介绍。
//1.3 范围运算符迭代
for index in 0...6 {
    print(index)
}
//OR
for _ in 0..<5 {
    print("I love Swift")    //注：swift中所有在下文不准备使用的参数，基本都可以用_ 来代替。
}

//1.4 stride(from:to:by:) 迭代    //swift4.0新增特性
let minuteInterval = 5
//for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
//    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
//}

//2.While 和 Repeat-While    与C语言中的while 和 do-while循环用法完全一致

//3.if-else 与 C语言中的if-else 没有本质区别，唯一分别是判断条件if后无需添加括号

//4.switch(注：必看swift中的switch不用每个case都需要写break，在匹配到对应的情况执行其内的操作后会结束整个switch操作。)
//4.1 switch常规发用
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":           //有相同执行代码的可以用，分割。
    print("The letter A")
case "b", "B":
    print("The letter B")
default:
    print("Not the letter A")
}

//4.2 范围运算在switch中应用
let approximateCount = 23
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// Prints "There are many moons orbiting Saturn.

//4.3 switch 与元组初级应用
let anotherPoint = (2, 0)
switch anotherPoint {
case (0, 0):         //符合（0， 0）这种情况的
    print("on the x-axis with an x value of 0, on the y-axis with a y value of 0")
case (let x, 0):    //但是满足y=0，都会执行这种情况的后续操作，并且把anotherPoint中x的值赋给let x 的常亮x，供执行代码使用。
    print("on the x-axis with an x value of \(x)")
case (0, let y):    //类似上一种情况，但是满足x=0，都会执行这种情况的后续操作，并且把anotherPoint中y的值赋给let y的常量y，供执行代码使用。
    print("on the y-axis with a y value of \(y)")
case (0 , _):        //只需要满足x=0
    print("on the x-axis with a x value of 0")
    fallthrough
case (-2...2, -2...2):   //x、y 分别满足在-2和2之间
    print("x is between -2 to 2,and y is between -2 to 2")
case let (x, y):    //可以大胆猜测，如果以上的条件都没有满足，那么则会执行该种情况的执行代码，并把anotherPoint的x、y分别赋值到元组（x, y）里
    print("somewhere else at (\(x), \(y))")
}
// Prints "on the x-axis with an x value of 2
//print("on the x-axis with a x value of 2")

//4.4 switch 与元组高级应用
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:     //当且仅当x=y才执行后续的代码
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:   //当且仅当x=-y才执行后续的代码
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):                 //同上一例用法
    print("(\(x), \(y)) is just some arbitrary point")
}

// Prints "(1, -1) is on the line x == -y”
// Prints "x = 1,y = -1”

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):      //compund cases 与赋值的结合
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
// Prints "On an axis, 9 from the origin
//5.控制流关键字
//continue:循环中结束当前循环，循环继续
//break:for循环中结束整个循环，即调转到}后面，循环结束,在switch里面不允许空的执行情况，此时可以添加break或者fallthrough执行对应的操作。
//fallthrough:swtch中继续向下判断下面的cases

//6.labeled statements,应用不多，while循环设置一个label，在循环过程中可以通过continue和break字段对该循环进行操作。
//let distance = 10
//labelName: while distance < 10 {
//    break labelName
//    continue labelName
//}

//7.***重要，官方推荐early exit，满足添加赋值，不满足条件直接返回，
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("\(name)")
}

//8.API可用性检测
if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS,使用与iOS 10，macOS 10.12 及以后
} else {
    // Fall back to earlier iOS and macOS APIs
}

