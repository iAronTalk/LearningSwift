//: [Previous](@previous)

import Foundation

//0.写在前头，swift是type safe语言，简单理解对于任何一个变量，要有明确的认识是什么类型，允不允许为nil。
let name = "Aaron" //常量  通过Type Inference，swift可以判断出来name的类型
var age = 27         //变量
age = 28

var bfName = "Ricky", gender = "male", nation = "USA"  //定义一组

var message: String
message = "I really like swift"
//OR
var message2: String = "I really like swift"
message2 = "I only like swift"

var red, green, blue: Double
red = 1.0; green = 2.0; blue = 3.0        //分号这样在swift中使用

print("I just said \(message)")          //打印和如何拼接字符串,可以拼接任何基本数据类型

//1.Integers整型
//Int,Int32,UInt,UInt16等等与C中不明显区别

let minOfInt32 = Int32.min    //提供两个方法最大值，最小值
let maxOfInt32 = Int32.max

//2.Floating-Point Numbers浮点型
//Double, Float 推荐使用Double,与OC中用法类似

//3.Numeric Literal
/*0b二进制,0o八进制,0x十六进制，与C无明显区别*/

//4.类型转换
/*Double把3转为浮点型，直接 three + pointOneFourOneFiveNine 编译不通过，这点与C不一样，这也是前面写的swift是type safe语言的一种表现*/
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine

//5.Type Aliases类型别名
typealias AudioType = UInt16
let maxAudio = AudioType.max

//6.Bool 布尔值
//Swift 使用ture和false，其他规则与C无区别

//7.Tuples元组(非常重要)
//元组是swift一种新的“集合类型”，可以作为参数传递，其内的值可以不一致，可以存储任何基本数据类型
let http404Error = (404, "Not Found")
//OR
let https404Error = (statusCode:404, description: "Not Found")  //两种定义方式

let code = http404Error.0; let des = http404Error.1
let httpsCode = https404Error.statusCode; let httpsDes = https404Error.description

let (statusCode, statusMessage) = http404Error   //分解元组
print(statusCode); print(statusMessage)

//8.Optional 可选值
/*简单说Optional做了一件什么事儿呢？ 就是明确的区别“可能为空的值”和“绝对不为空的值”
 *”可能为空的值“在定义的时候在类型名后面添加？，可以把nil赋给变量（即使是Int类型），swift中的nil与C中的nil不一样，这个nil不是指向一空地址，而仅仅表达一个类型的值为空。
 */
var answer: String? = "Check it out"
answer = nil
var surveyAnswer: Int? //swift会给可选值类型默认赋值为nil

//unwrapping（没想出来好的中文意思表达）
answer = "Check it out"
if answer != nil {
    print("The answer is \(answer!)") //感叹号！读取“可选值”内包含的值，(Forced Unwrapping)强制解析可选值，注意，如果answer为空，采用牵制解析会崩溃，不建议使用。
}
//OR
if let answer = answer {
    print("The anwser is \(answer)") //采用if-let这种Optional Binding(可选绑定）的方式解析，如果answer有值，那么把值赋给answer，执行{}内的代码，安全使用，推荐
}
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
//OR
func checkAnswer(){
    guard let answer = answer else { return }
    print("The answer is \(answer)")    //安全使用answer
}
//Implicitly Unwrapped Optionals明确解析可选值
var assumedString: String! = "An implicitly unwrapped optional string."
//assumedString = nil  如果设置assumedString为nil，下次应用该变量会发生崩溃。
let implicitString: String? = assumedString // 无需感叹号，但注意，一旦assumedString为nil，这里会触发runtime error，如果再程序运行中则会发生崩溃，即使implicitString为optional类型，不建议使用。

//9.Assertions and Preconditions断言和前置处理，目前还没想的太通透
