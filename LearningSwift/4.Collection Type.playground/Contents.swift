import UIKit

var greeting = "Hello, playground"

var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

var shoppingList = ["Eggs", "Milk", "Eggs", "Milk", "Eggs", "Milk", "Eggs", "Milk"]

shoppingList[4...6] = ["Bananas", "Apples"]

for item in shoppingList {
    print(item)
}

// inset append remove

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}


var letters = Set<Character>()

let immuLetter: Set<Character> = []

// insersection symmetricDifference union subtracing
// isSubset isSuperset isDisjoint

var airports: Dictionary<String, String> = [:]
let airports2 = Dictionary<String, String>()

// updateValue, removeValue,
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary doesn't contain a value for DUB.")
}
// Prints "The removed airport's name is Dublin Airport."

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
