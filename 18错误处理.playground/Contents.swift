//: Playground - noun: a place where people can play

import UIKit

//错误处理（Error handling）*是响应错误以及从错误中恢复的过程。Swift 提供了在运行时对可恢复错误的抛出、捕获、传递和操作的一等公民支持 某些操作无法保证总是执行完所有代码或总是生成有用的结果。可选类型可用来表示值缺失，但是当某个操作失败时，最好能得知失败的原因，从而可以作出相应的应对。举个例子，假如有个从磁盘上的某个文件读取数据并进行处理的任务，该任务会有多种可能失败的情况，包括指定路径下文件并不存在，文件不具有可读权限，或者文件编码格式不兼容。区分这些不同的失败情况可以让程序解决并处理某些错误，然后把它解决不了的错误报告给用户。

//-------- 表示并抛出错误 -----------

enum VendingMachineError: Error{
    
    case invalidSelection // 选择无效
    case insufficientFunds(coinsNeeded: Int) //余额不足
    case outOfStock  //缺货
}

//抛出一个错误可以让你表明有意外情况发生，导致正常的执行流程无法继续执行，抛出错误
throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

//某个错误被抛出时，附近的某部分代码必须负责处理这个错误，例如纠正这个问题、尝试另外一种方式、或是向用户报告错误。
//
//Swift 中有`4`种处理错误的方式。你可以把函数抛出的错误传递给调用此函数的代码、用`do-catch`语句处理错误、将错误作为可选类型处理、或者断言此错误根本不会发生。每种方式在下面的小节中都有描述。
//
//当一个函数抛出一个错误时，你的程序流程会发生改变，所以重要的是你能迅速识别代码中会抛出错误的地方。为了标识出这些地方，在调用一个能抛出错误的函数、方法或者构造器之前，加上`try`关键字，或者`try?`或`try!`这种变体。这些关键字在下面的小节中有具体讲解。
//
//> 注意
//> Swift 中的错误处理和其他语言中用`try`，`catch`和`throw`进行异常处理很像。和其他语言中（包括 Objective-C ）的异常处理不同的是，Swift 中的错误处理并不涉及解除调用栈，这是一个计算代价高昂的过程。就此而言，`throw`语句的性能特性是可以和`return`语句相媲美的。
//



//-----------用 throwing 函数传递错误---------------

//为了表示一个函数、方法或构造器可以抛出错误，在函数声明的参数列表之后加上`throws`关键字。一个标有`throws`关键字的函数被称作*throwing 函数*。如果这个函数指明了返回值类型，`throws`关键词需要写在箭头（`->`）的前面。


//func canThrowErrors() throws -> String
//func cannotThrowErrors() -> String
//
//
//一个 throwing 函数可以在其内部抛出错误，并将错误传递到函数被调用时的作用域。
//
//> 注意
//只有 throwing 函数可以传递错误。任何在某个非 throwing 函数内部抛出的错误只能在函数内部处理。
//


//下面的例子中，`VendingMachine`类有一个`vend(itemNamed:)`方法，如果请求的物品不存在、缺货或者投入金额小于物品价格，该方法就会抛出一个相应的`VendingMachineError`：
struct Item{
    
    var price: Int
    var count: Int
    
}

class VeningMachins{
    
    var inventory = ["Candy Bar": Item(price:12, count: 7),
                     "Chips": Item(price:10, count: 4),
                     "Pretzels":Item(price: 7, count: 1
    ]
    
    var coinsDeposited  = 0
    func dispenseSnack(snack: String)  {
        
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name: String)throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
    
}

//在`vend(itemNamed:)`方法的实现中使用了`guard`语句来提前退出方法，确保在购买某个物品所需的条件中，有任一条件不满足时，能提前退出方法并抛出相应的错误。由于`throw`语句会立即退出方法，所以物品只有在所有条件都满足时才会被售出。

//因为`vend(itemNamed:)`方法会传递出它抛出的任何错误，在你的代码中调用此方法的地方，必须要么直接处理这些错误——使用`do-catch`语句，`try?`或`try!`；要么继续将这些错误传递下去。例如下面例子中，`buyFavoriteSnack(_:vendingMachine:)`同样是一个 throwing 函数，任何由`vend(itemNamed:)`方法抛出的错误会一直被传递到`buyFavoriteSnack(person:vendingMachine:) `函数被调用的地方。
let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}
struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

do {
    try expression
    statements
} catch pattern 1 {
    statements
} catch pattern 2 where condition {
    statements
}


var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack("Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.InvalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.OutOfStock {
    print("Out of Stock.")
} catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}

//-------禁用错误传递-------

//有时你知道某个`throwing`函数实际上在运行时是不会抛出错误的，在这种情况下，你可以在表达式前面写`try!`来禁用错误传递，这会把调用包装在一个不会有错误抛出的运行时断言中。如果真的抛出了错误，你会得到一个运行时错误。
//
//例如，下面的代码使用了`loadImage(atPath:)`函数，该函数从给定的路径加载图片资源，如果图片无法载入则抛出一个错误。在这种情况下，因为图片是和应用绑定的，运行时不会有错误抛出，所以适合禁用错误传递：
//
//```swift
let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")
//```






//----------指定清理操作-----------
//
//可以使用`defer`语句在即将离开当前代码块时执行一系列语句。该语句让你能执行一些必要的清理工作，不管是以何种方式离开当前代码块的——无论是由于抛出错误而离开，还是由于诸如`return`或者`break`的语句。例如，你可以用`defer`语句来确保文件描述符得以关闭，以及手动分配的内存得以释放。
//
//`defer`语句将代码的执行延迟到当前的作用域退出之前。该语句由`defer`关键字和要被延迟执行的语句组成。延迟执行的语句不能包含任何控制转移语句，例如`break`或是`return`语句，或是抛出一个错误。延迟执行的操作会按照它们被指定时的顺序的相反顺序执行——也就是说，第一条`defer`语句中的代码会在第二条`defer`语句中的代码被执行之后才执行，以此类推。
//
//```swift
func processFile(filename: String) throws {
    if exists(filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() {
            // 处理文件。
        }
        // close(file) 会在这里被调用，即作用域的最后。
    }
}
//```
//
//上面的代码使用一条`defer`语句来确保`open(_:)`函数有一个相应的对`close(_:)`函数的调用。
//
//> 注意
//> 即使没有涉及到错误处理，你也可以使用`defer`语句。


