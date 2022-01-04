import UIKit

// 关键字 init
/*
 1.Classes and structures must set all of their stored properties to an appropriate initial value by the time an instance of that class or structure is created. Stored properties can’t be left in an indeterminate state.
 */
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
}

/*
 2.Optional Property Types 可以不用初始化
 */

// Default Initializers

/*
 3.如果所有的stored property定义都赋初值，则无需显示的初始化方法
 */

/*
 4.结构体默认有一个成员初始化方法
 */

struct Size {
    var width = 0.0, height = 0.0
    init(height: Double) {
        self.width = 0
        self.height = Double(height)
    }
}
let twoByTwo1 = Size.init(height: 2.0)
//let twoByTwo = Size(width: 2.0, height: 2.0)

/*
 5.值类型的如果定义了custom 初始化方法，那么默认初始化方法和成员初始化方法就失效了。
 *两个办法解决，重新实现默认方法和成员初始化方法。2.那么把初始化方法写到extension里面。
 */

// 6.Class Inheritance and Initialization

/*
 1.所有的stored property（包括继承的）都要初始化
 2.两种初始化方法：designated initializers and convenience initializers.
 3.一般情况下只有一个designated initializers。
 */

//init(parameters) {
//    statements
//}
//
//convenience init(parameters) {
//    statements
//}

/*
 * Designated initializers must always delegate up.
 * Convenience initializers must always delegate across.
 
 Super:    Designated <-- Convenience <-- Convenience
               |    \
               |     ---
               |        \
 Subclass: Designated <-- Designated  <-- Convenience
 */

/*
 6.子类先初始化自己的属性在调用super，调用完super再初始化继承的属性，
 */
/*
 7.An initializer can’t call any instance methods, read the values of any instance properties, or refer to self as a value until after the first phase of initialization is complete.
 */

/*
 8.phase two is what?
 */

/*
 9.Unlike subclasses in Objective-C, Swift subclasses don’t inherit their superclass initializers by default.
 * 如果非要这么做，1.只能重写Designated init，前面放置关键字override.如果是Convenience init不需要关键字。2.或者第二种，就是子类没有任何Designated init，那么会继承父类所有的Designated init。如果子类也没有添加任何其他方法，那么也将继承父类的所有convenience inits.
 
 * 另外，如果不管用什么方式提供所有父类的designated init实现，那么也将继承所有的convenience inits.
 */

/*10.f a subclass initializer performs no customization in phase 2 of the initialization process, and the superclass has a zero-argument designated initializer, you can omit a call to super.init() after assigning values to all of the subclass’s stored properties.
 */

// Failable Initializers
// 关键字 init？，可以return ni

/*
 11.Enumerations with raw values automatically receive a failable initializer, init?(rawValue:)
 */

/*
 12.You can override a failable initializer with a nonfailable initializer but not the other way around.
 */

/*
 13.You can use forced unwrapping in an initializer to call a failable initializer from the superclass as part of the implementation of a subclass’s nonfailable initializer.
 */


/*
 14. ! 这种force unwrapping，有什么用。
 */

/*
 15.Write the "required" modifier before the definition of a class initializer to indicate that every subclass of the class must implement that initializer
 */

/*
 16.Setting a Default Property Value with a Closure or Function，完成一些类其他方法属性无关的初始化操作。
 */
//class SomeClass {
//    let someProperty: SomeType = {
//        // create a default value for someProperty inside this closure
//        // someValue must be of the same type as SomeType
//        return someValue
//    }()
//}


/*
 * Deinitialization
 */
// 1.关键字 deinit

// 系统会帮你处理对象的生命周期等，但是如果是类似于自己打开文件，写入文件，需要在deinit期间进行关闭文件等操作。
