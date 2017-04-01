//: Playground - noun: a place where people can play

import UIKit
import Foundation
//默认属性值

struct Fahrenheit{
    
    var temperature:Double
    init( ){
            temperature = 32.0
        }
}
var f = Fahrenheit()
print("the default temperature is \(f.temperature)")

//--自定义构造过程

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius 是 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius 是 0.0
//第一个构造器拥有一个构造参数，其外部名字为`fromFahrenheit`，内部名字为`fahrenheit`；第二个构造器也拥有一个构造参数，其外部名字为`fromKelvin`，内部名字为`kelvin`。这两个构造器都将唯一的参数值转换成摄氏温度值，并保存在属性`temperatureInCelsius`中。

//参数的内部名称和外部名称跟函数和方法参数相同，构造参数也拥有一个在构造器内部使用的参数名字和一个在调用构造器时使用的外部参数名字。然而，构造器并不像函数和方法那样在括号前有一个可辨别的名字。因此在调用构造器时，主要通过构造器中的参数名和类型来确定应该被调用的构造器。正因为参数如此重要，如果你在定义构造器时没有提供参数的外部名字，Swift 会为构造器的每个参数自动生成一个跟内部名字相同的外部名。
//以下例子中定义了一个结构体`Color`，它包含了三个常量：`red`、`green`和`blue`。这些属性可以存储`0.0`到`1.0`之间的值，用来指示颜色中红、绿、蓝成分的含量。

//`Color`提供了一个构造器，其中包含三个`Double`类型的构造参数。`Color`也可以提供第二个构造器，它只包含名为`white`的`Double`类型的参数，它被用于给上述三个构造参数赋予同样的值。

struct Color{
    
    let red,green,blue: Double
    init(red: Double, green: Double, blue: Double) {
        
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
    
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

//不带外部名的构造器参数
//struct Celsius {
//    var temperatureInCelsius: Double
//    init(fromFahrenheit fahrenheit: Double) {
//        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
//    }
//    init(fromKelvin kelvin: Double) {
//        temperatureInCelsius = kelvin - 273.15
//    }
//    init(_ celsius: Double){
//        temperatureInCelsius = celsius
//    }
//}
//let bodyTemperature = Celsius(37.0)
//// bodyTemperature.temperatureInCelsius 为 37.0
//```
//
//调用`Celsius(37.0)`意图明确，不需要外部参数名称。因此适合使用`init(_ celsius: Double)`这样的构造器，从而可以通过提供`Double`类型的参数值调用构造器，而不需要加上外部名。




//可选属性类型

class SurveyQuestion{
    var text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."



//构造过程中常量属性的修改

//你可以在构造过程中的任意时间点给常量属性指定一个值，只要在构造过程结束时是一个确定的值。一旦常量属性被赋值，它将永远不可更改。
//注意 对于类的实例来说，它的常量属性只能在定义它的类的构造过程中修改；不能在子类中修改。


class SurveyQuestion1{
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask(){
        print(text)
    }
}

let beetsQuestion = SurveyQuestion1(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets. (But not with cheese.)"

//指定构造器和便利构造器
//便利构造器也采用相同样式的写法，但需要在`init`关键字之前放置`convenience`关键字，并使用空格将它们俩分开：
//类的指定构造器的写法跟值类型简单构造器一样：
//

//init(parameters) {
//    statements
//}

//
//便利构造器也采用相同样式的写法，但需要在`init`关键字之前放置`convenience`关键字，并使用空格将它们俩分开：

//convenience init(parameters) {
//    statements
//}



// 类的构造器代理规则

//##### 规则 1
//指定构造器必须调用其直接父类的的指定构造器。
//
//##### 规则 2
//便利构造器必须调用*同*类中定义的其它构造器。
//
//##### 规则 3
//便利构造器必须最终导致一个指定构造器被调用。



