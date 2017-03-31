//: Playground - noun: a place where people can play

import UIKit


// 1 使用`class`和類名來創建一個類。類中屬性的聲明和常量、變量聲明一樣，唯一的區別就是它們的上下文是類。同樣，方法和函數聲明也一樣。
class Shape{
    
    var numberOfsides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfsides) sides"
    }
}

//练习 使用`let`添加一個常量屬性，再添加一個接收一個參數的方法。

class Person{
    
    let  name = "yumiaohua"
    let height = 160.0
    var weight = 100
    func personInfo(_ age:CGFont) -> String {
        
        return "\(name) height=\(height),wight=\(weight),age=\(age)"
    }
    
    
}

// 2 要創建一個類的實例，在類名後面加上括號。使用點語法來訪問實例的屬性和方法。

var shap = Shape()
shap.numberOfsides = 7
var shapeDescription = shap.simpleDescription()



class NamedShape{
    
    var numberOfSides:Int = 0
    var name:String
    
    init(name:String) {
        self.name = name
    }
    func simpleDescription() -> String {
        
    return "A \(name) with \(numberOfSides) sides"
    }
    
    
}

var nameShape = NamedShape(name: "奔驰")
let nameShapeDescription = nameShape.simpleDescription()

//注意：`self`被用來區別實例變量。當你創建實例的時候，像傳入函數參數一樣給類傳入構造器的參數。每個屬性都需要賦值——無論是通過聲明（就像`numberOfSides`）還是通過構造器（就像`name`）

/*如果你需要在刪除對像之前進行一些清理工作，使用`deinit`創建一個析構函數。

子類的定義方法是在它們的類名後面加上父類的名字，用冒號分割。創建類的時候並不需要一個標準的根類，所以你可以忽略父類。

子類如果要重寫父類的方法的話，需要用`override`標記——如果沒有添加`override`就重寫父類方法的話編譯器會報錯。編譯器同樣會檢測`override`標記的方法是否確實在父類中。
*/

class Square: NamedShape{
    
    var sideLength: Double
    
    init(sideLength: Double,name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
        
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}


var test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

//創建`NamedShape`的另一個子類`Circle`，構造器接收兩個參數，一個是半徑一個是名稱，實現`area`和`describe`方法。

class Circle: NamedShape{
    
    var sideLength:Double
    init(sideLength: Double,name: String) {
        self.sideLength = sideLength
        super.init(name: name)
    }
    
    func a() -> Double {
        return 3.1415*sideLength*sideLength
    }
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
    
}


var test1 = Circle(sideLength: 3.0, name: "圆")
test1.a()
test1.simpleDescription()


//屬性可以有 getter 和 setter 。

class EquilateralTriangle:NamedShape{
    
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double{
        
        get{
            return 3.0 * sideLength
        }
        
        set{
            sideLength = newValue / 3.0
        }
        
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)."
    }

    
}


var triangle = EquilateralTriangle(sideLength: 3.1, name: "a traingle")

triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength
/*在`perimeter`的 setter 中，新值的名字是`newValue`。你可以在`set`之後顯式的設置一個名字。

注意`EquilateralTriangle`類的構造器執行了三步：

1. 設置子類聲明的屬性值
2. 調用父類的構造器
3. 改變父類定義的屬性值。其他的工作比如調用方法、getters和setters也可以在這個階段完成。

如果你不需要計算屬性，但是仍然需要在設置一個新值之前或者之後運行代碼，使用`willSet`和`didSet`。

比如，下面的類確保三角形的邊長總是和正方形的邊長相同。
*/
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
triangleAndSquare.triangle.sideLength

//類中的方法和一般的函數有一個重要的區別，函數的參數名只在函數內部使用，但是方法的參數名需要在調用的時候顯式說明（除了第一個參數）。默認情況下，方法的參數名和它在方法內部的名字一樣，不過你也可以定義第二個名字，這個名字被用在方法內部。
//

class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times: Int) {
        count += amount * times
    }
}
var counter = Counter()
counter.incrementBy(amount:2, numberOfTimes: 7)


//處理變量的可選值時，你可以在操作（比如方法、屬性和子腳本）之前加`?`。如果`?`之前的值是`nil`，`?`後面的東西都會被忽略，並且整個表達式返回`nil`。否則，`?`之後的東西都會被運行。在這兩種情況下，整個表達式的值也是一個可選值。

let optionalSquare:Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

//使用enum来创建一个枚举，就像类和其他所有类型一样，枚举可以包含方法

		