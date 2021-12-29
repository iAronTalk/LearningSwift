import UIKit

/*
 Computed properties are provided by classes, structures, and enumerations.
 
 Stored properties are provided only by classes and structures.
 */

/*
 This behavior is due to structures being value types. When an instance of a value type is marked as a constant, so are all of its properties.
 */

/*
 Lazy Stored Properties lazy
 */

// Computed properties

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY) // if this is a single expression, can safe return, it will be like
            /*
             get {
                    Point(x: origin.x + (size.width / 2),
                          y: origin.y + (size.height / 2))
                     }
             */
        }
        set(newCenter) { // 如果不设置默认为：newValue ,if no setter, then it is a read-only computed property
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

// Property Observers (willSet didSet)

// @propertyWrapper
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    private var maximum: Int
    var wrappedValue: Int {
        get {return number}
        set { number = min(newValue, maximum)}
    }
    
    init() {
        maximum = 12
        number = 0
    }
    
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}
// 或者

struct SmallRectangle2 {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { return _height.wrappedValue }
        set { _height.wrappedValue = newValue }
    }
    var width: Int {
        get { return _width.wrappedValue }
        set { _width.wrappedValue = newValue }
    }
}
struct MixedRectangle {
    @TwelveOrLess var height: Int = 1
    @TwelveOrLess(maximum: 9) var width: Int = 2
}

var rectangle = SmallRectangle2()
var mixedRec = MixedRectangle()
print(mixedRec.height)
print(mixedRec.width)
mixedRec.width = 19
print(mixedRec.width)

// projected value
@propertyWrapper
struct SmallNumber {
    private var number: Int
    private(set) var projectedValue: Bool  // 必须这么写projectedValue

    var wrappedValue: Int { // 必须这么写wrappedValue
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }

    init() {
        self.number = 0
        self.projectedValue = false
    }
}

struct SomeStructure {
    @SmallNumber var someNumber: Int
}
var someStructure = SomeStructure()

someStructure.someNumber = 4
print(someStructure.$someNumber)
// Prints "false"

someStructure.someNumber = 55
print(someStructure.$someNumber)

/*非常重要 -- You can apply a property wrapper to a local stored variable, but not to a global variable or a computed variable.*/

// Type Properties 类的属性，可以在实例中改变。
struct SomeStructure2 {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration2 {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass2 {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int { // 子类可以复写，static子类不可以
        return 107
    }
}

class subSomeClass2: SomeClass2 {
    override static var overrideableComputedTypeProperty: Int {
        return 108
    }
}
