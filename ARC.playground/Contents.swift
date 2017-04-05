//: Playground - noun: a place where people can play

import UIKit

//class Person{
//    
//    let name: String
//    init(name: String) {
//        self.name = name
//        print("\(name) is being initialized")
//    }
//    deinit {
//        print("\(name) is being deinitialize")
//    }
//    
//}
//
//var reference1: Person?
//var reference2: Person?
//var reference3: Person?
//
//reference1 = Person(name: "John Appleseed")
//reference2 = reference1
//reference3 = reference1
//reference1 = nil
//reference2 = nil
//reference3 = nil


//--------类实例之间的循环强引用-----------
class Person1 {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person1?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person1?
var unit4A: Apartment?

john = Person1(name: "John Appleseed")
unit4A = Apartment(unit: "4A")
john!.apartment = unit4A
unit4A!.tenant = john

//在将两个实例联系在一起之后，强引用的关系如图所示：
//
//![](https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Art/referenceCycle02_2x.png)
//    
//    不幸的是，这两个实例关联后会产生一个循环强引用。`Person`实例现在有了一个指向`Apartment`实例的强引用，而`Apartment`实例也有了一个指向`Person`实例的强引用。因此，当你断开`john`和`unit4A`变量所持有的强引用时，引用计数并不会降为`0`，实例也不会被 ARC 销毁：
//    
//    ```swift
//    john = nil
//    unit4A = nil
//    ```
//    
//    注意，当你把这两个变量设为`nil`时，没有任何一个析构函数被调用。循环强引用会一直阻止`Person`和`Apartment`类实例的销毁，这就在你的应用程序中造成了内存泄漏。
//    
//    在你将`john`和`unit4A`赋值为`nil`后，强引用关系如下图：
//    
//    ![](https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Art/referenceCycle03_2x.png)
//    
//    `Person`和`Apartment`实例之间的强引用关系保留了下来并且不会被断开。
