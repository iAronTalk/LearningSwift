import UIKit

var greeting = "Hello, playground"
(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" aren't compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"

("blue", -1) < ("purple", 1)        // OK, evaluates to true
//("blue", false) < ("purple", true)  // Error because < can't compare Boolean values


// Nil-Coalescing Operator ??, which means a != nil ? a! : b
let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName

// One-Sided Ranges that useed in array
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names[2...] {
    print(name)
}

for name in names[...3] {
    print(name)
}

for name in names[..<3] {
    print(name)
}
