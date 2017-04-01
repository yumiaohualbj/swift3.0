//: Playground - noun: a place where people can play

import UIKit


//一个类可以*继承*另一个类的方法，属性和其它特性。当一个类继承其它类时，继承类叫*子类*，被继承类叫*超类（或父类）*。在 Swift 中，继承是区分「类」与其它类型的一个基本特征。
//在 Swift 中，类可以调用和访问超类的方法，属性和下标，并且可以重写这些方法，属性和下标来优化或修改它们的行为。Swift 会检查你的重写定义在超类中是否有匹配的定义，以此确保你的重写行为是正确的。
//
//可以为类中继承来的属性添加属性观察器，这样一来，当属性值改变时，类就会被通知到。可以为任何属性添加属性观察器，无论它原本被定义为存储型属性还是计算型属性。
//不继承于其它类的类，称之为*基类*。

class Vehicle{
    
    var currentSpeed = 0.0
    var description :String{
        
        return "traveling at \(currentSpeed) miles per hours"
    }
    
    func makeNoise() {
        // 什么也不做-因为车辆不一定会有噪音
    }
}

let someVehicle = Vehicle()

print("Vehicle :\(someVehicle.description)")

//继承类 增加新的属性
class Bicycle: Vehicle{
    
    var hasBasket = false
    
}

let  bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")


class Tandem: Bicycle{
    
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")


//重写方法
class Train: Vehicle{
    
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

//重写属性
class Car: Vehicle{
    
    var gear = 1
    override var description: String{
        
        return super.description + "in gear \(gear)"
    }
    
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 2
print("Car: \(car.description)")


//重写属性观察器
//你可以通过重写属性为一个继承来的属性添加属性观察器。这样一来，当继承来的属性值发生改变时，你就会被通知到，无论那个属性原本是如何实现的。关于属性观察器的更多内容，请看[属性观察器](../chapter2/10_Properties.html#property_observers)。
//    
//     注意
//你不可以为继承来的常量存储型属性或继承来的只读计算型属性添加属性观察器。这些属性的值是不可以被设置的，所以，为它们提供`willSet`或`didSet`实现是不恰当。
//此外还要注意，你不可以同时提供重写的 setter 和重写的属性观察器。如果你想观察属性值的变化，并且你已经为那个属性提供了定制的 setter，那么你在 setter 中就可以观察到任何值变化了。

class AutomaticCar: Car{
    
    override var currentSpeed: Double{
        didSet{
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let  automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")


//防止重写

//你可以通过把方法，属性或下标标记为*`final`*来防止它们被重写，只需要在声明关键字前加上`final`修饰符即可（例如：`final var`，`final func`，`final class func`，以及`final subscript`）。
//
//如果你重写了带有`final`标记的方法，属性或下标，在编译时会报错。在类扩展中的方法，属性或下标也可以在扩展的定义里标记为 final 的。
//
//你可以通过在关键字`class`前添加`final`修饰符（`final class`）来将整个类标记为 final 的。这样的类是不可被继承的，试图继承这样的类会导致编译报错。

		