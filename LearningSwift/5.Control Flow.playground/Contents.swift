import UIKit

// for in
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

let power = 5
for _ in 1...power {
   
}

// While repeat-while
// if
// switch
/*  Wrong code *** 错误代码
 let anotherCharacter: Character = "a"
 switch anotherCharacter {
 case "a": // Invalid, the case has an empty body
 case "A":
     print("The letter A")
 default:
     print("Not the letter A")
 }
 */
// right code
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

// 1...2 can be after case
// tuple can be after case
// value binding and where
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y) where x == y:
    print("somewhere else at (\(x), \(y))")
default:
    print("nothing")
}

/*
 The fallthrough keyword doesn’t check the case conditions for the switch case that it causes execution to fall into. The fallthrough keyword simply causes code execution to move directly to the statements inside the next case (or default case) block, as in C’s standard switch statement behavior.
 */

//  break will terminate the switch
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
case 8, 9, 10:
    description += " + 8 9 10"
default:
    description += " an integer."
}
print(description)

/*
 if #available(platform name version, ..., *) {
     statements to execute if the APIs are available
 } else {
     fallback statements to execute if the APIs are unavailable
 }
 */

// labeled Statements，labeled statements可以实现类似于C语言中goto语句的功能，一般不推荐使用。
/*
 label name: while condition {
     statements
 }
 */


