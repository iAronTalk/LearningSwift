import UIKit

/*Classes, structures, and enumerations can define subscripts, which are shortcuts for accessing the member elements of a collection, list, or sequence.*/

struct TimesTable {
    let multiplier: Int
    subscript(index: String) -> Int { // 所以说index可以是任何类型，也不一定是Int，return 也可以是任何类型。
        
        return multiplier * (Int(index) ?? 2) // readonly
//        get {} readwrite
//        set {}
    }
}

let timeTable = TimesTable.init(multiplier: 3)
print(timeTable["a4"])

// Subscript Options，这个太棒了，可以多参数like matrix[1, 4]
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

// Type Subscripts，跟标记属性为类属性一样，可以用static，如果类想让子类集成，使用class关键字
