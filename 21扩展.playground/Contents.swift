//: Playground - noun: a place where people can play

import UIKit

//*扩展* 就是为一个已有的类、结构体、枚举类型或者协议类型添加新功能。这包括在没有权限获取原始源代码的情况下扩展类型的能力（即 *逆向建模* ）。扩展和 Objective-C 中的分类类似。（与 Objective-C 不同的是，Swift 的扩展没有名字。）
//Swift 中的扩展可以：
//    
//    - 添加计算型属性和计算型类型属性
//    - 定义实例方法和类型方法
//    - 提供新的构造器
//    - 定义下标
//    - 定义和使用新的嵌套类型
//    - 使一个已有类型符合某个协议


//在 Swift 中，你甚至可以对协议进行扩展，提供协议要求的实现，或者添加额外的功能，从而可以让符合协议的类型拥有这些功能。你可以从[协议扩展](./22_Protocols.html#protocol_extensions)获取更多的细节。

//扩展可以为一个类型添加新的功能，但是不能重写已有的功能。

//-----------扩展语法---------------


//extension SomeType{
//    //为SomeType 添加的新功能写到这里
//}

//可以通过扩展来扩展一个已有类型，使其采纳一个或多个协议。在这种情况下，无论是类还是结构体，协议名字的书写方式完全一样：
//
//extension SomeType: SomeProtocol, AnotherProctocol {
//    // 协议实现写到这里
//}


//--------------计算型属性---------------
//扩展可以为已有类型添加计算型实例属性和计算型类型属性。下面的例子为 Swift 的内建 `Double` 类型添加了五个计算型实例属性，从而提供与距离单位协作的基本支持：

extension Double {
    var km: Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}


let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// 打印 “One inch is 0.0254 meters”
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// 打印 “Three feet is 0.914399970739201 meters”

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")
// 打印 “A marathon is 42195.0 meters long”

//注意:扩展可以添加新的计算型属性，但是不可以添加存储型属性，也不可以为已有属性添加属性观察器。

//---------构造器---------------

