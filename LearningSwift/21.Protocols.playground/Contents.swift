import UIKit

// 1.defines methods, properties,adopted by class structure enumeration

protocol SomeProtocol {
    // 不用声明是stored还是computed属性，都可以
    var mustBeSettable: Int { get set } // 声明属性要指定get和set
    static func someTypeMethod()
    func random() -> Double
    mutating func toggle() // 可能会改变内部属性
    init(someParameter: Int)
}

class SomeClass: SomeProtocol {
    var mustBeSettable: Int
    
    static func someTypeMethod() {
        
    }
    
    func random() -> Double {
        return 0.0
    }
    
    func toggle() {
        
    }
    
    required init(someParameter: Int) {
        self.mustBeSettable = 1
        // required 是必须的。
    }
}

// 2.代理

// 3.拓展里面添加protocol

// 4.自动添加的protocol，主要是structure和enumeration
// Equatable, Hashable, and Comparable

//5. protocol 继承
protocol AnotherProtocol {
    
}
protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    // protocol definition goes here
}

// 6.class-only protocol
protocol SomeClassOnlyProtocol: AnyObject, SomeProtocol {
    // class-only protocol definition goes here
}

//7.协议组合 a: protocola & protocolb

//8.协议服从与否
// is  as? as!

//9.写法
let objects: [AnyObject] = []


//10.可以不用实现的protocol,只能是objc类型的。
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}
// 11.协议也可以拓展
//extension RandomNumberGenerator {
//    func randomBool() -> Bool {
//        return random() > 0.5
//    }
//}

// 12.协议也可以给方法和计算属性提供默认实现，如果实现协议的类型有自己的实现，默认的会被覆盖。

// 13.协议加限制
extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}
