//: Playground - noun: a place where people can play

import UIKit


//*方法*是与某些特定类型相关联的函数。类、结构体、枚举都可以定义实例方法；实例方法为给定类型的实例封装了具体的任务与功能。类、结构体、枚举也可以定义类型方法；类型方法与类型本身相关联。类型方法与 Objective-C 中的类方法（class methods）相似。
//
//结构体和枚举能够定义方法是 Swift 与 C/Objective-C 的主要区别之一。在 Objective-C 中，类是唯一能定义方法的类型。但在 Swift 中，你不仅能选择是否要定义一个类/结构体/枚举，还能灵活地在你创建的类型（类/结构体/枚举）上定义方法。


//---------实例方法------------

class Counter{
    
    var  count = 0
    
    func increment()  {
        count += 1
    }
    
    func increment(by amount:Int)  {
        
        count += amount
    }
    
    func reset()  {
        count = 0
    }
    
}

/*`Counter`类定义了三个实例方法：
    - `increment`让计数器按一递增；
- `increment(by: Int)`让计数器按一个指定的整数值递增；
- `reset`将计数器重置为0。
 */