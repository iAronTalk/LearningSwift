import UIKit

// 1.(Unlike Objective-C categories, Swift extensions don’t have names.)

// 2.Extension Syntax
extension Double {
    
}

// 3.Computed Properties，给其添加计算属性
extension Double {
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// Prints "One inch is 0.0254 meters"

//4.Initializers
// If you provide a new initializer with an extension, you are still responsible for making sure that each instance is fully initialized once the initializer completes.

//5.Methods
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
extension Int {
    mutating func square() {
        self = self * self
    }
}

// 6.Subsripts
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
746381295[0]
// returns 5

// Nested type 拓展


