import UIKit

// 1.func 关键字

// 2.当入参与属性一样，可以使用self来区分，常规无需要。

// 3.Swift的方法明确知道是否需要修改属性，如果需要那么方法前面要加关键字：mutating

// 4.可以再mutating方法中改变自己，可怕！！！
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
// ovenLight is now equal to .high
ovenLight.next()
// ovenLight is now equal to .off


// 5.类方法，使用关键字class

// 6.@discardableResult，方法有返回值，需要接收方，否则警告，标记为discardableResult，去掉警告，无需要接收方。
