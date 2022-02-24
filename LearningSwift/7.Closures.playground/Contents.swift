import UIKit

// Closure Expression Syntax

//{ (parameter) - > (return type) in
//
//}
// 内置closure
let names = ["aaron", "aarin", "lily", "tim", "tom"]
var reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2 }
)

reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } ) // not recommend, not readable

// 单表达式才可以。
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } ) // only happens to Single-Expression Closures

// 单表达式才可以。 Swift  动对行内 包提供简写实际参数名 可以   $0 , $1 , $2 等名字来引用 包
// 的实际参数值。
reversedNames = names.sorted(by: { $0 > $1 } ) // type/return/in all can be omited

// 单表达式才可以。
reversedNames = names.sorted(by: >) // 大无语事件

// 函数
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

// Here's how you call this function without using a trailing closure:
// 闭包
someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

// Here's how you call this function with a trailing closure instead:
// 闭包，可以把closure放置后面
// 作为函数最后一个实际参数传给函数
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

// 作为唯一参数，可以挪到外面
reversedNames = names.sorted() { $0 > $1 }

reversedNames = names.sorted { $0 > $1 }

//names.sorted(by: {() -> in })
// 这只是函数
//func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
//    if let picture = download("photo.jpg", from: server) {
//        completion(picture)
//    } else {
//        onFailure()
//    }
//}

// Closures Are Reference Types
// @escaping 网络回调类似的case
var completionHandlers: Array<() -> Void> = []
var completionHandlers2: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

// a nonescaping closure, which means it can refer to self implicitly,escaping closure can not ,so you need to do this: someFunctionWithEscapingClosure { [self] in x = 100 }
//struct SomeStruct {
//    var x = 10
//    mutating func doSomething() {
//        someFunctionWithNonescapingClosure { x = 200 }  // Ok
//        someFunctionWithEscapingClosure { x = 100 }     // Error
//    }
//}

class SomeOtherClass {
    var x = 10
    func doSomething() {
        x = 20
    }
}

let someIns = SomeOtherClass()
someIns.doSomething()
print(someIns.x)

// Autoclosures 不常用，暂时能看懂即可。
