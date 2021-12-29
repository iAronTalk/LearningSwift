import UIKit

struct SomeStructure {
    // structure definition goes here
}
class SomeClass {
    // class definition goes here
}

// Structures and Enumerations Are Value Types

// In fact, all of the basic types in Swift—integers, floating-point numbers, Booleans, strings, arrays and dictionaries—are value types, and are implemented as structures behind the scenes.
// 旨在发生变动的时候才会发生真正的copy，这里有个优化处理
