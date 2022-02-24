import UIKit

//1.如何解决循环引用

// weak reference(weak) and unowned references(unowned)

// weak reference:A weak reference is a reference that doesn’t keep a strong hold on the instance it refers to.

//unowned references:is used when the other instance has the same lifetime or a longer lifetime.

// both can be nil weak
// one can be nil,another will not unowned
// both can not be nil, one of them should be !

// 2.closure 循环引用问题
class HTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }

}
