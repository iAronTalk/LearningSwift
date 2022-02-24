import UIKit

var greeting = "Hello, playground"

let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024

print(dollarSign)
//let threeDoubleQuotationMarks = """
////Escaping the first quotation mark \"""
//Escaping all three quotation marks \"\"\"
//"""
//print(threeDoubleQuotationMarks)

//By using #,we can easily use """ in a string.
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

print(threeMoreDoubleQuotationMarks)
for character in "Dog!🐶" {
    print(character)
}
var str: String
var d: Character = "d"
print(d)

// swift deaultly take "" as string, so you should specify the array element as character
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
var catString = String(catCharacters)
print(catString)

catString.append(d) // a string can also appends a character

// string accessing and modifying
// swift string accessing and mofifying is just a shit,you never wanna use this, strongly recommend you change the string to an array, and modify the array and then change the array back to string.
var greetingGuten = "Guten Tag"
greeting[greetingGuten.startIndex]
let subGreeingGuten = greeting[greetingGuten.startIndex..<greetingGuten.index(greetingGuten.startIndex, offsetBy: 4)];
print(subGreeingGuten)

print(greetingGuten[greetingGuten.index(after: greeting.startIndex)])
let index1 = greetingGuten.index(greetingGuten.startIndex, offsetBy: 4)
let indexT = greetingGuten.firstIndex(of: "T") ?? greeting.endIndex
let toFirstT = greetingGuten[..<indexT]

let firstChar = greetingGuten[greetingGuten.startIndex]

print(type(of: toFirstT))

print(greetingGuten[index1])

greetingGuten.insert("a", at: greetingGuten.index(greetingGuten.startIndex, offsetBy: 5))
greetingGuten.remove(at: greetingGuten.startIndex)

greetingGuten.hasPrefix("a")
greetingGuten.hasSuffix("b")

let greetingDog = "Dog!🐶"
for utf8D in greetingDog.utf8 {
    print("\(utf8D)")
}

// 留下两个目前不那么重要的问题，UTF-8 和 Unicode Scalar 啥区别？简答，两种编码，utf-8 更省磁盘。

let names = ["a", "b", "c", "d", "e"]
let range2 = ...2
for i in names[range2] {
    print(i)
}


