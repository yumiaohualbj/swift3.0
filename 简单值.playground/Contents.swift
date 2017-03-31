//: Playground - noun: a place where people can play

import UIKit

print("Hello, playground")

var myVariable = 42 // var 变量
myVariable = 50
let myCount = 42  //let 常量


//如果初始值没有提供足够的信息（或者没有初始值），那你需要在变量后面声明类型，用冒号分割。
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

//练习 创建一个常量，显式指定类型为`Float`并指定初始值为 4。

let ex1:Float = 4.0


// swift 值永远不会被隐式转换为其他类型。如果你需要把一个值转换成其他类型，请显式转换。

let label = "The width is"
let width  = 94
let widthLabel = label+" " + String(width)


// 练习：
//删除最后一行中的`String`，错误提示是什么？ note: overloads for '+' exist with these partially matching parameter lists: (Int, Int), (String, String), (UnsafeMutablePointer<Pointee>, Int), (UnsafePointer<Pointee>, Int)



//有一种更简单的把值转换成字符串的方法：把值写到括号中，并且在括号之前写一个反斜杠。
let apples = 3
let oranges = 5
let appleSum = "I have \(apples) apples"
let appleColor  = "I have \(apples + oranges) apples"

    
//练习：
//使用`\()`来把一个浮点计算转换成字符串，并加上某人的名字，和他打个招呼。
let name = "于淼华"
let weight :Float = 60.0
let info = "\(name)的体重是\(weight)"
let info1  = name + String(weight)

//使用方括号`[]`来创建数组和字典，并使用下标或者键（key）来访问元素。最后一个元素后面允许有个逗号

var  arrList = ["1","2","3"]
arrList[1] = "4"

var occupations  = ["ymh":"female","lbj":"male"]
occupations["ymh"] = "China"

//要创建一个空数组或者字典，使用初始化语法。

let emptyArray = [String]()
let emptyDictionary = [String:Float]()

//如果类型信息可以被推断出来，你可以用`[]`和`[:]`来创建空数组和空字典——就像你声明变量或者给函数传参数的时候一样。
arrList = []
occupations = [:]

//---------- 控制流 --------------

//使用`if`和`switch`来进行条件操作，使用`for-in`、`for`、`while`和`repeat-while`来进行循环。包裹条件和循环变量括号可以省略，但是语句体的大括号是必须的。

let individualScores = [85,78,60,67,100]
var teamScore = 0

for score in individualScores {
    if score > 60 {
        teamScore += 3
    }else{
        teamScore += 1
    }
}
print(teamScore)


/*在`if`语句中，条件必须是一个布尔表达式——这意味着像`if score { ... }`这样的代码将报错，而不会隐形地与 0 做对比。

你可以一起使用`if`和`let`来处理值缺失的情况。这些值可由可选值来代表。一个可选的值是一个具体的值或者是`nil`以表示值缺失。在类型后面加一个问号来标记这个变量的值是可选的。
*/

var optionsString :String? = "yumiaohua"
print(optionsString == nil)

//练习把`optionalName`改成`nil`，greeting会是什么？添加一个`else`语句，当`optionalName`是`nil`时给 greeting 赋一个不同的值。
//

var optionsName:String?  = nil

var greeting = "Hello"

if let name = optionsName {
    greeting = "Hello,\(name)"
    
}else{
    
    
    greeting = "hello,空值"
}


//如果变量的可选值是`nil`，条件会判断为`false`，大括号中的代码会被跳过。如果不是`nil`，会将值解包并赋给`let`后面的常量，这样代码块中就可以使用这个值了。
//另一种处理可选值的方法是通过使用 `??` 操作符来提供一个默认值。如果可选值缺失的话，可以使用默认值来代替。

let nickName:String? = nil
let fullName: String = "yu"
let infomalGreeting = "Hi,\(nickName ?? fullName)"



//`switch`支持任意类型的数据以及各种比较操作——不仅仅是整数以及测试相等。
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

    
//练习：> 添加另一个变量来记录最大数字的种类(kind)，同时仍然记录这个最大数字的值。

//使用`while`来重复运行一段代码直到不满足条件。循环条件也可以在结尾，保证能至少循环一次。
var n = 1
var sum = 0

while n<10 {
    sum += n
    n += 1
}
print(sum)

var m = 1

repeat{
   m = m*2
}while m<50
print(m)

//你可以在循环中使用`..<`来表示范围。
var t = 0
for i in 1..<5 {
    t += i
}
print(t)




//---------闭包和函数------------

//使用`func`来声明一个函数，使用名字和参数来调用函数。使用`->`来指定函数返回值的类型。
func greet (person: String,day:String)->String{
    
    return "Hello\(person),today is \(day)"
}
greet(person: "yu", day: "san")

//练习： 删除`day`参数，添加一个参数来表示今天吃了什么午饭。
func greet1 (person:String,food:String)->String{
    return "\(person) eat \(food)"
}

greet1(person: "yu", food: "牛肉")


//默认情况下，函数使用它们的参数名称作为它们参数的标签，在参数名称前可以自定义参数标签，或者使用 `_` 表示不使用参数标签。
func eg3(_ person:String,on day:String)->String{
    
    return "\(person),today is \(day)"
}
		
eg3("yu", on: "Tu")


//使用元组来让一个函数返回多个值。该元组的元素可以用名称或数字来表示。

func calculateStatistics(scores:[Int])->(min:Int, max:Int, sum:Int){
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        }else if score < min{
            min = score
        }
        sum += score
    }
    
    return(min,max,sum)
    
}

let result = calculateStatistics(scores:[15,30,60])
print(result)

//函数可以带有可变个数的参数，这些参数在函数内表现为数组的形式：

func sumOf(numbers:Int...)->Int{
    var sum = 0
    
    for number in numbers {
       sum += number
    }
    
    return sum
}


let resutl1 = sumOf(numbers:1,2,3)


//写一个计算参数平均值的函数
func avg(numbers:[Int])->Int{
    
    var sum = 0
    var count = 0
    for number in numbers {
        sum += number
        count += 1
    }
    
    return (sum/count)
    
}
print(avg(numbers:[1,2,3]))

//函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数。

func returnFifteen()->Int{
    var y = 10
    func add(){
        y += 5
    }
    add()
    
    return y
    
}

returnFifteen()

//函数是第一等类型，这意味着函数可以作为另一个函数的返回值。

func makeIncrementer()->((Int)->Int){
    
    func addOne(number:Int)->Int{
        return 1 + number
    }
    
    return addOne
}

var increment = makeIncrementer()
increment(7)

//函数也可以当做参数传入另一个函数。

func hasAnyMatchs(list:[Int],condition:(Int)->Bool) ->Bool{
    
    for item in list {
        if condition(item) {
            return true
        }
    }
    
    return false
}


func lessThanTen(number:Int)->Bool{
   return number < 10
    
}

var numbers = [20, 19, 7, 12]
hasAnyMatchs(list: numbers, condition: lessThanTen)

//函数实际上是一种特殊的闭包:它是一段能之后被调取的代码。闭包中的代码能访问闭包所建作用域中能得到的变量和函数，即使闭包是在一个不同的作用域被执行的 - 你已经在嵌套函数例子中所看到。你可以使用`{}`来创建一个匿名闭包。使用`in`将参数和返回值类型声明与闭包函数体进行分离。
// 重写闭包，对所有奇数返回 0。




//----------对象和类---------