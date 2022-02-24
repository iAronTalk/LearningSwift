import UIKit

var greeting = "Hello, playground"

func greet(person: String) -> String {
    return "hello" + " " + person;
}

print(greet(person: "aaron"))

// return tupels
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    // return nil
    return (1, 2)
}

if let bounds = minMax(array: [1, 2, 4]) {
    print("\(bounds.min) + \(bounds.max)")
}

// from is argumen label, hometown is parameter
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}

func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(1, secondParameterName: 2)
func someFunction2(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}

someFunction2(parameterWithoutDefault: 1)

// Variadic Parameters (一个可变形式参数可以接受 或 多个特定类型的值)
// The values passed to a variadic parameter are made available within the function’s body as an array of the appropriate type.
// 感觉不算是什么特别实用的tips
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers

// inout

// take function as type
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
var mathFunction: (Int, Int) -> Int = addTwoInts

// take function as parameter
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

// take function as return value
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

// nested function
func chooseStepFunction2(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}

// inout 参数 使用的时候使用&。


