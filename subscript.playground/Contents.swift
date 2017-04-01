//: Playground - noun: a place where people can play

import UIKit
import Foundation
/*下标*可以定义在类、结构体和枚举中，是访问集合，列表或序列中元素的快捷方式。可以使用下标的索引，设置和获取值，而不需要再调用对应的存取方法。举例来说，用下标访问一个`Array`实例中的元素可以写作`someArray[index]`，访问`Dictionary`实例中的元素可以写作`someDictionary[key]`。

一个类型可以定义多个下标，通过不同索引类型进行重载。下标不限于一维，你可以定义具有多个入参的下标满足自定义类型的需求。
*/
//
//下标允许你通过在实例名称后面的方括号中传入一个或者多个索引值来对实例进行存取。语法类似于实例方法语法和计算型属性语法的混合。与定义实例方法类似，定义下标使用`subscript`关键字，指定一个或多个输入参数和返回类型；与实例方法不同的是，下标可以设定为读写或只读。这种行为由 getter 和 setter 实现，有点类似计算型属性：


/*
 subscript(index: Int)-> Int{
    
    get {
        // 返回一个适当的 Int 类型的值
    }
    
    set(newValue) {
        // 执行适当的赋值操作
    }
}
 */



struct TimesTable{
    
    let multiplier: Int
    subscript(index: Int)-> Int{
        
        return multiplier * 3
    }
    
}

let threeTimesTable =  TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")


