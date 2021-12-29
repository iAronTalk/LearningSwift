//: [Previous](@previous)

import Foundation

/*基本运算符*/

//0.说在前面,关于swift中基本运算符与C中并无太大差别，所以在此不会又大篇幅的说明。唯独几处不一致和新添加的运算符，在下面予以解释和说明。如果您没有任何计算机语言经验，那么这部分仍然建议您查阅C语言关于基本运算符的章节。

//1. = ,==, <, > 可以用于元组
let (x, y) = (1, 2)
(3, "apple") < (3, "bird")    // true ,因为3 等于 3, 并且 "apple" 小于 "bird

//2.范围运算符a...b(包括a和b) 和 a..<b(包括a，不包括b), 注意没有<..（X）
for i in 0...3 {
    print("\(i)") //打印0，1，2，3，
}

//3.单边范围运算符...3, 2...
let range = ...3
let array = [2, 4, 5 ,5]
for item in array[range] {
    print("\(item)")
}
range.contains(2)

//4.Swift中无++，--
var a = 0
//a++ 会报错哦。


