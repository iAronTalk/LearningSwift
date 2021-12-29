//: [Previous](@previous)

import Foundation

/*构造数据类型：数组，字典，集合*/
//0.写在前面，数据，字典，集合在swift中的用法与OC中区别不大，只是用法更贴近swifte而已。如果您没有编程基础，可以先了解C 或者 OC 中关于这部分的说明，细节的说明会在更新的文章中进行说明。
//集合和字典是无序的，数组是有序的集合。

//1.Array(数组)
//1.1 创建
var createEmptyArray = Array<String>()
var createEmptyArrayTwo = [String]()         //推荐
var createEmptyArrayThree:[String] = []      //推荐
var createEmptyArrayFour: [String] = Array()

var threeDouble = Array.init(repeating: 0.0, count: 3)
var shoppingList: [String] = ["Eggs", "Milk"]
//var shoppingList = ["Eggs", "Milk"] //这样初始化也是没有问题的，swift会推断出数组的元素类型
//1.2 操作
shoppingList.append("Flour") //添加在结合最后
shoppingList.removeLast()    //删除最后一个元素

shoppingList.insert("Powder", at: 2)   //指定位置添加 OR
shoppingList[1] = "Cheese"             //同上
let removedElement = shoppingList.remove(at: 2) //指定位置删除

shoppingList += ["Spread", "Butter"]   //批量添加
shoppingList[4...6] = ["Bananas", "Apples"]   //Swift4.0 特性

//shoppingList.removeAll()  //删除操作非常多，可以自行查阅，皆是以remove开头
//shoppingList = []         //同removeAll()

let elementOfIndexTwo = shoppingList[2]  //获取某个位置的元素

//1.3 常用属性
shoppingList.isEmpty
shoppingList.count

//迭代，与OC的for-in迭代相同，或者参考后面的Control-Flow一节

//2.Dictionary(字典)
//2.1 创建类似数组
var createEmptyDic = Dictionary<String, Int>()
var createEmptyDicTwo = [String: Int]()         //推荐
var createEmptyDicThree:[String: Int] = [:]     //推荐
var createEmptyDicFour:[String: Int] = Dictionary()

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]  //这样初始化也是没有问题的，swift会推断字典类型

//2.2 操作
airports["Beijing"] = "Beijing International"   //增加一项
airports["ChangSha"] = "HuangHua International"   //增加一项
airports["Beijing"] = nil                       //删除一项
let removed = airports.removeValue(forKey: "ChangSha")  //删除一项,返回可选值类型（Optional）

airports["YYZ"] = "Toronto"    //更改某个key对应的值
let updated = airports.updateValue("Toronto Pearson", forKey: "YYZ")  //同上

/*字典取值，得到是可选值类型，关于可选择值的解析可以参考TheBasic一节
 */
if let airportName = airports["DUB"] {
print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}
//2.3-迭代,下面元组迭代，其他的keys和values迭代同OC,或者参考Control-Flow一节
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

//2.4 常用属性
airports.isEmpty
airports.count

//2.5 keys 和 values 转化为数组
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

//3.集合,集合用的地方相对较少，其定义和使用与数组相差不多，但唯一谨记，集合无序，且不存在相同元素。


