import UIKit

var greeting = "Hello, playground"


// LANGUAGE GUIDE

// -- The Basics
// 1
/*
 NOTE
 If you need to give a constant or variable the same name as a reserved Swift keyword, surround the keyword with backticks (`) when using it as a name. However, avoid using keywords as names unless you have absolutely no choice.
 */
var `public` = "fdsafsadf"

`public` = "dafsdfadfsd"


// 2.Numeric Literals
/*
 For decimal numbers with an exponent of exp, the base number is multiplied by 10exp:

 1.25e2 means 1.25 x 102, or 125.0.
 1.25e-2 means 1.25 x 10-2, or 0.0125.
 For hexadecimal numbers with an exponent of exp, the base number is multiplied by 2exp:

 0xFp2 means 15 x 22, or 60.0.
 0xFp-2 means 15 x 2-2, or 3.75.
 */

// 3
typealias audioSample = UInt
var maxFound: audioSample = 1

// 4 Tuple
let http404 = (404, "not found")
print(http404)
let (statusCode: Int, description: String) = (0, "nothing")
let http200 = (status: 200, description: "ok")
let http500 = (statusCode: 500, description: "fdas")
let (statusCode, _) = http200
print(http500)
print(http200)
print(http200.status)
print(http200.1)

// 5
/*
 The question mark indicates that the value it contains is optional, meaning that it might contain some Int value, or it might contain no value at all. (It can’t contain anything else, such as a Bool value or a String value. It’s either an Int, or it’s nothing at all.)
 
 In swift nil is not a pointer, it is the absence of a value of a cetain type
 */
var severResponseCode: Int? = 4
severResponseCode = nil

var assumedString: String! = "An optional string"
assumedString = nil
let implicitString: String? = assumedString
print(implicitString ?? "safe")

// 6
// assertionFailure and preconditionFailure directly crash without checking conditon
var age = 0;
//assert(age > 3)
//assertionFailure("A person's age can't be less than zero.")

let index = 0;
//precondition(index > 0, "Index must be greater than zero.")
//preconditionFailure("Index must be greater than zero.")

