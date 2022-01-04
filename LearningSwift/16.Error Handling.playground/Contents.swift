import UIKit

var greeting = "Hello, playground"

// try, catch and throw
//Swift 用下面四种方式去处理error

//1.函数中，返回箭头前边放置throws关键字表明该函数可能抛出异常

//func canThrowErrors() throws -> String {}



//2.调动一个可能抛出异常的函数，调用前使用try关键字

//3.do-try-catch
/*
 do {
     try expression
     statements
 } catch pattern 1 {
     statements
 } catch pattern 2 where condition {
     statements
 } catch pattern 3, pattern 4 where condition {
     statements
 } catch {
     statements
 }
 */

//4.扔出去的error必现得到处理
/*
 func nourish(with item: String) throws {
     do {
         try vendingMachine.vend(itemNamed: item)
     } catch is VendingMachineError {
         print("Couldn't buy that from the vending machine.")
     }
 }

 do {
     try nourish(with: "Beet-Flavored Chips")
 } catch {
     print("Unexpected non-vending-machine-related error: \(error)")
 }
 如果nourish中的error都是VendingMachineError error，那么nourish自己就处理，如果不是，那么调用方要处理。
 */

//5.方法二，把error转为optional Values ---> nil  (try？)
func someThrowingFunction() throws -> Int {
    // ...
    return 1
}

let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}

//6.方法三，如果明确知道运行时某个函数不会抛出异常，那么可以用使用try!

//7.defer
/*
 defer 是干什么用的

 很简单，用一句话概括，就是 defer block 里的代码会在函数 return 之前执行，无论函数是从哪个分支 return 的，还是有 throw，还是自然而然走到最后一行。
 */
