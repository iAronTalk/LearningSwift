import UIKit

enum SomeEnum {
    
}

enum Planet {
    case mercury, venus
    case earth, mars, jupiter, saturn
}

let planetMercury = Planet.mercury
let earth: Planet = .earth

switch earth {
case .earth:
    print("earth")
default:
    print("no planet")
}

enum Beverage: CaseIterable {
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases.count

// Associated Values
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

let upc = Barcode.upc(1, 2, 3, 4)
let qrCode = Barcode.qrCode("luanma")
switch qrCode {
case .qrCode(let numberSys):
    print("\(numberSys)")
case let .upc(a, _, _, _):
    print("\(a)")
}

// Raw Values
enum ASCIIChar: Character {
    case tab = "\t"
    case lineFeed = "\n"
}

enum Planet2: Int {
    case mercury = 1, venus, earth, mars
}

enum CompassPoint: String {
    case north, south, east, west
}
print(CompassPoint.north.rawValue)

// raw value 初始化
if let possibleDir = CompassPoint.init(rawValue: "north-west") {
    print(possibleDir.rawValue)
} else {
    print("there is no this dir in CompassPoint")
}

// Recursive Enumerations, 平时可能用不到，暂时能看懂就好。
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
// or
/*
 indirect enum ArithmeticExpression {
     case number(Int)
     case addition(ArithmeticExpression, ArithmeticExpression)
     case multiplication(ArithmeticExpression, ArithmeticExpression)
 }
 */

/*
 Identical to (===)
 Not identical to (!==)
 
 Equal to (==)
 Not equal to (!=)
 */
