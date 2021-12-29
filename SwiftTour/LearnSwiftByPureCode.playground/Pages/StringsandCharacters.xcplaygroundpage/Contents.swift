//: [Previous](@previous)

import Foundation

/*字符串和字符*/

//0.写在前面，字符串是值类型（value type），而非引用类型.关于swift中的 multiline string(多行字符串)""" here """ 查看官方文档或者下面，传送门：https://stackoverflow.com/questions/24091233/swift-split-string-over-multiple-lines
//  注意：swift4 特性的代码只有在xcode9.0以上才可以运行

//1.字符串
var emptyString = "" //or String(),定义空字符
let isEmpty = emptyString.isEmpty

let constantString = "Here is a constant string"
var variableString = "Here is a variable string"

var characterDog: [Character] = ["D", "o", "g", "s", " ", "🐶", "🐶", "🐶"] //注：arbitrary Unicode scalar 显示方式为：\u{n}。
let heart: Character = "\u{2665}";
characterDog.append(heart)

let stringDog = String(characterDog)

//constantString += "!"   报错
let count = 3
variableString += " with \(count) " + stringDog  //swift中插入、拼接非常简单，字符串直接用+或者+=，数值类型使用\(count)即可。
let specialCharacter = "\"\(variableString) ! \""  //特殊字符的处理与C差距不大

let combinationString = constantString + variableString;
combinationString.count  //Swift4 属性

for character in combinationString.characters {
    print(character)
}

//2.字符串操作
var greeting = "Hello There!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

print(greeting.characters, separator: ",", terminator: " ")
//greeting[greeting.endIndex] // Error
//greeting.index(after: greeting.endIndex) // Error

//插入
var welcome = "hello"
let indexs = welcome.indices //获取所有index

welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))  //Swift4 对这个方法进行了重写

//删除
welcome.remove(at: welcome.index(before: welcome.endIndex))
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex  //会头看看a..<b 的用法。
welcome.removeSubrange(range)

let indexOfComma = welcome.index(of: ",") ?? welcome.endIndex  //swift4 特性
let beginning = welcome[..<index]                     //swift4 特性,注：index为String.Index 类型，为后面介绍的Struct类型

if welcome == beginning { //不相等判断为!=
    print("welcome equals to beginning")
}
if welcome.hasPrefix("hello") {
    print("welcome has prefix hello")
}
if welcome.hasSuffix("world") {
    print("welcome has suffix world")
}

//不常用属性, 传送门：google.com
welcome.utf8
welcome.utf16
welcome.unicodeScalars

