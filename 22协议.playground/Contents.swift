//: Playground - noun: a place where people can play

import UIKit

//*协议* 定义了一个蓝图，规定了用来实现某一特定任务或者功能的方法、属性，以及其他需要的东西。类、结构体或枚举都可以遵循协议，并为协议定义的这些要求提供具体实现。某个类型能够满足某个协议的要求，就可以说该类型*遵循*这个协议。
//
//除了遵循协议的类型必须实现的要求外，还可以对协议进行扩展，通过扩展来实现一部分要求或者实现一些附加功能，这样遵循协议的类型就能够使用这些功能。
//
//



//----------协议语法--------------


//protocol SomeProtocol{
//    
//    //这里是协议的定义部分
//}

//要让自定义类型遵循某个协议，在定义类型时，需要在类型名称后加上协议名称，中间以冒号（`:`）分隔。遵循多个协议时，各协议之间用逗号（`,`）分隔：


//struct SomeStructure: FirstProtocol, AnotherProtocol {
//    // 这里是结构体的定义部分
//}
//


//拥有父类的类在遵循协议时，应该将父类名放在协议名之前，以逗号分隔
//class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
//    // 这里是类的定义部分
//}


//-------属性要求----------

//协议可以要求遵循协议的类型提供特定名称和类型的实例属性或类型属性。协议不指定属性是存储型属性还是计算型属性，它只指定属性的名称和类型。此外，协议还指定属性是可读的还是可读可写的。
//如果协议要求属性是可读可写的，那么该属性不能是常量属性或只读的计算型属性。如果协议只要求属性是可读的，那么该属性不仅可以是可读的，如果代码需要的话，还可以是可写的。


//协议总是用 `var` 关键字来声明变量属性，在类型声明后加上 `{ set get }` 来表示属性是可读可写的，可读属性则用 `{ get }` 来表示：
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

//在协议中定义类型属性时，总是使用 `static` 关键字作为前缀。当类类型遵循协议时，除了 `static` 关键字，还可以使用 `class` 关键字来声明类型属性：
protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}


protocol FullyNamed {
    var fullName: String { get }
}

//`FullyNamed` 协议除了要求遵循协议的类型提供 `fullName` 属性外，并没有其他特别的要求。这个协议表示，任何遵循 `FullyNamed` 的类型，都必须有一个可读的 `String` 类型的实例属性 `fullName`。
//下面是一个遵循 `FullyNamed` 协议的简单结构体


struct Person: FullyNamed{
    
    var fullName: String
    
}

let  johh = Person(fullName: "John Applesed")
print("\(johh.fullName)")

//这个例子中定义了一个叫做 `Person` 的结构体，用来表示一个具有名字的人。从第一行代码可以看出，它遵循了 `FullyNamed` 协议。

//`Person` 结构体的每一个实例都有一个 `String` 类型的存储型属性 `fullName`。这正好满足了 `FullyNamed` 协议的要求，也就意味着 `Person` 结构体正确地符合了协议。（如果协议要求未被完全满足，在编译时会报错。）


//下面是一个更为复杂的类，它适配并遵循了 `FullyNamed` 协议：

class Starship: FullyNamed{
    
    var prefix: String?
    var name: String
    init(name: String,prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        
        return (prefix != nil ? prefix! + " ":" ") + name
    }
    
}

var ncc1701  = Starship(name: "Enterprise", prefix: "USS")
print("ncc1701.fullName 是 \(ncc1701.fullName)")

//`Starship` 类把 `fullName` 属性实现为只读的计算型属性。每一个 `Starship` 类的实例都有一个名为 `name` 的非可选属性和一个名为 `prefix` 的可选属性。 当 `prefix` 存在时，计算型属性 `fullName` 会将 `prefix` 插入到 `name` 之前，从而为星际飞船构建一个全名。


//-----------方法要求----------------

//协议可以要求遵循协议的类型实现某些指定的实例方法或类方法。这些方法作为协议的一部分，像普通方法一样放在协议的定义中，但是不需要大括号和方法体。可以在协议中定义具有可变参数的方法，和普通方法的定义方式相同。但是，不支持为协议中的方法的参数提供默认值。

//正如属性要求中所述，在协议中定义类方法的时候，总是使用 `static` 关键字作为前缀。当类类型遵循协议时，除了 `static` 关键字，还可以使用 `class` 关键字作为前缀：

//protocol SomeProtocol {
//    static func someTypeMethod()
//}


//下面的例子定义了一个只含有一个实例方法的协议：
protocol RandomNumberGenerator {
    func random() -> Double
}


//`RandomNumberGenerator` 协议要求遵循协议的类型必须拥有一个名为 `random`， 返回值类型为 `Double` 的实例方法。尽管这里并未指明，但是我们假设返回值在 `[0.0,1.0)` 区间内。

//`RandomNumberGenerator` 协议并不关心每一个随机数是怎样生成的，它只要求必须提供一个随机数生成器。

//如下所示，下边是一个遵循并符合 `RandomNumberGenerator` 协议的类。该类实现了一个叫做 *线性同余生成器（linear congruential generator）* 的伪随机数算法。

class LinearCongratuentialGenerator: RandomNumberGenerator{
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

let generator = LinearCongratuentialGenerator()
print("Here's a random number: \(generator.random())")
// 打印 “Here's a random number: 0.37464991998171”
print("And another one: \(generator.random())")
// 打印 “And another one: 0.729023776863283”



//--------------------------------Mutating 方法要求---------------------------------------
//有时需要在方法中改变方法所属的实例。例如，在值类型（即结构体和枚举）的实例方法中，将 `mutating` 关键字作为方法的前缀，写在 `func` 关键字之前，表示可以在该方法中修改它所属的实例以及实例的任意属性的值。这一过程在[在实例方法中修改值类型](./11_Methods.html#modifying_value_types_from_within_instance_methods)章节中有详细描述。

//如果你在协议中定义了一个实例方法，该方法会改变遵循该协议的类型的实例，那么在定义协议时需要在方法前加 `mutating` 关键字。这使得结构体和枚举能够遵循此协议并满足此方法要求。

//实现协议中的 `mutating` 方法时，若是类类型，则不用写 `mutating` 关键字。而对于结构体和枚举，则必须写 `mutating` 关键字。

//如下所示，`Togglable` 协议只要求实现一个名为 `toggle` 的实例方法。根据名称的暗示，`toggle()` 方法将改变实例属性，从而切换遵循该协议类型的实例的状态。

//`toggle()` 方法在定义的时候，使用 `mutating` 关键字标记，这表明当它被调用时，该方法将会改变遵循协议的类型的实例：

protocol Togglable{
    mutating func toggle()
}

//当使用枚举或结构体来实现 `Togglable` 协议时，需要提供一个带有 `mutating` 前缀的 `toggle()` 方法。
//下面定义了一个名为 `OnOffSwitch` 的枚举。这个枚举在两种状态之间进行切换，用枚举成员 `On` 和 `Off` 表示。枚举的 `toggle()` 方法被标记为 `mutating`，以满足 `Togglable` 协议的要求：

enum OnOffSwitch: Togglable{
    
    case off,on
    mutating func toggle() {
        
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        default:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
print("lightSwitch的值是：\(lightSwitch)")



//----------------------构造器-------------------------------
//协议可以要求遵循协议的类型实现指定的构造器。你可以像编写普通构造器那样，在协议的定义里写下构造器的声明，但不需要写花括号和构造器的实体：

//class SomeClass: SomeProtocol {
//    required init(someParameter: Int) {
//        // 这里是构造器的实现部分
//    }
//}
//





//---------------------- 构造器要求在类中的实现-------------------------
//class SomeClass1: SomeProtocol {
//    required init(someParameter: Int) {
//        // 这里是构造器的实现部分
//    }
//}
//使用 `required` 修饰符可以确保所有子类也必须提供此构造器实现，从而也能符合协议。
//    > 注意
//    > 如果类已经被标记为 `final`，那么不需要在协议构造器的实现中使用 `required` 修饰符，因为 `final` 类不能有子类。关于 `final` 修饰符的更多内容，请参见[防止重写](./13_Inheritance.html#preventing_overrides)。
//
//如果一个子类重写了父类的指定构造器，并且该构造器满足了某个协议的要求，那么该构造器的实现需要同时标注 `required` 和 `override` 修饰符：

//protocol SomeProtocol {
//    init()
//}
//
//class SomeSuperClass {
//    init() {
//        // 这里是构造器的实现部分
//    }
//}
//
//class SomeSubClass: SomeSuperClass, SomeProtocol {
//    // 因为遵循协议，需要加上 required
//    // 因为继承自父类，需要加上 override
//    required override init() {
//        // 这里是构造器的实现部分
//    }
//}
//


//---------------------- 可失败构造器要求---------------------- 
//协议还可以为遵循协议的类型定义可失败构造器要求，详见[可失败构造器](./14_Initialization.html#failable_initializers)。

//遵循协议的类型可以通过可失败构造器（`init?`）或非可失败构造器（`init`）来满足协议中定义的可失败构造器要求。协议中定义的非可失败构造器要求可以通过非可失败构造器（`init`）或隐式解包可失败构造器（`init!`）来满足。




//----------------------协议作为类型----------------------

//尽管协议本身并未实现任何功能，但是协议可以被当做一个成熟的类型来使用。
//
//协议可以像其他普通类型一样使用，使用场景如下：
//    
//    * 作为函数、方法或构造器中的参数类型或返回值类型
//    * 作为常量、变量或属性的类型
//    * 作为数组、字典或其他容器中的元素类型
//注意> 协议是一种类型，因此协议类型的名称应与其他类型（例如 `Int`，`Double`，`String`）的写法相同，使用大写字母开头的驼峰式写法，例如（`FullyNamed` 和 `RandomNumberGenerator`）。

//下面是将协议作为类型使用的例子：

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}


//例子中定义了一个 `Dice` 类，用来代表桌游中拥有 N 个面的骰子。`Dice` 的实例含有 `sides` 和 `generator` 两个属性，前者是整型，用来表示骰子有几个面，后者为骰子提供一个随机数生成器，从而生成随机点数。
//
//`generator` 属性的类型为 `RandomNumberGenerator`，因此任何遵循了 `RandomNumberGenerator` 协议的类型的实例都可以赋值给 `generator`，除此之外并无其他要求。
//
//`Dice` 类还有一个构造器，用来设置初始状态。构造器有一个名为 `generator`，类型为 `RandomNumberGenerator` 的形参。在调用构造方法创建 `Dice` 的实例时，可以传入任何遵循 `RandomNumberGenerator` 协议的实例给 `generator`。
//
//`Dice` 类提供了一个名为 `roll` 的实例方法，用来模拟骰子的面值。它先调用 `generator` 的 `random()` 方法来生成一个 `[0.0,1.0)` 区间内的随机数，然后使用这个随机数生成正确的骰子面值。因为 `generator` 遵循了 `RandomNumberGenerator` 协议，可以确保它有个 `random()` 方法可供调用。
//
//下面的例子展示了如何使用 `LinearCongruentialGenerator` 的实例作为随机数生成器来创建一个六面骰子：


var d6 = Dice(sides: 6, generator: LinearCongratuentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}


//---------------------委托（代理）模式----------------------

//*委托*是一种设计模式，它允许类或结构体将一些需要它们负责的功能委托给其他类型的实例。委托模式的实现很简单：定义协议来封装那些需要被委托的功能，这样就能确保遵循协议的类型能提供这些功能。委托模式可以用来响应特定的动作，或者接收外部数据源提供的数据，而无需关心外部数据源的类型。


protocol DiceGame{
    var dice: Dice { get }
    func play()
}


protocol DiceGameDelegate{
    
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll:Int)
    func gameDidEnd(_ game: DiceGame)
}

//`DiceGame` 协议可以被任意涉及骰子的游戏遵循。`DiceGameDelegate` 协议可以被任意类型遵循，用来追踪 `DiceGame` 的游戏过程。



class SnakesAndLadders: DiceGame{
    
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongratuentialGenerator())
    var square = 0
    var board:[Int]
    init() {
         board = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    var delegate : DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop:while square != finalSquare{
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }

            
        }
        
        delegate?.gameDidEnd(self)
    }
    
    
    
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}


//关于这个蛇梯棋游戏的详细描述请参阅 [控制流](./05_Control_Flow.html) 章节中的 [Break](./05_Control_Flow.html#break) 部分。
//
//这个版本的游戏封装到了 `SnakesAndLadders` 类中，该类遵循了 `DiceGame` 协议，并且提供了相应的可读的 `dice` 属性和 `play()` 方法。（ `dice` 属性在构造之后就不再改变，且协议只要求 `dice` 为可读的，因此将 `dice` 声明为常量属性。）
//
//游戏使用 `SnakesAndLadders` 类的 `init()` 构造器来初始化游戏。所有的游戏逻辑被转移到了协议中的 `play()` 方法，`play()` 方法使用协议要求的 `dice` 属性提供骰子摇出的值。
//
//注意，`delegate` 并不是游戏的必备条件，因此 `delegate` 被定义为 `DiceGameDelegate` 类型的可选属性。因为 `delegate` 是可选值，因此会被自动赋予初始值 `nil`。随后，可以在游戏中为 `delegate` 设置适当的值。
//
//`DicegameDelegate` 协议提供了三个方法用来追踪游戏过程。这三个方法被放置于游戏的逻辑中，即 `play()` 方法内。分别在游戏开始时，新一轮开始时，以及游戏结束时被调用。
//
//因为 `delegate` 是一个 `DiceGameDelegate` 类型的可选属性，因此在 `play()` 方法中通过可选链式调用来调用它的方法。若 `delegate` 属性为 `nil`，则调用方法会优雅地失败，并不会产生错误。若 `delegate` 不为 `nil`，则方法能够被调用，并传递 `SnakesAndLadders` 实例作为参数。



//--------------------------------通过扩展添加协议一致性----------------------

//即便无法修改源代码，依然可以通过扩展令已有类型遵循并符合协议。扩展可以为已有类型添加属性、方法、下标以及构造器，因此可以符合协议中的相应要求。详情请在[扩展](./21_Extensions.html)章节中查看。

//例如下面这个 `TextRepresentable` 协议，任何想要通过文本表示一些内容的类型都可以实现该协议。这些想要表示的内容可以是实例本身的描述，也可以是实例当前状态的文本描述：

protocol TextRepresentable{
    
    var textualDescription:String { get }
}

//可以通过扩展，令先前提到的Dice类遵循并符合TextRepresentable协议

extension Dice: TextRepresentable{
    
    var textualDescription:String {
    
    return "A \(sides)-sided dice"
    
    }
}
//通过扩展遵循并符合协议，和在原始定义中遵循并符合协议的效果完全相同。协议名称写在类型名之后，以冒号隔开，然后在扩展的大括号内实现协议要求的内容。
let d12 = Dice(sides: 12, generator: LinearCongratuentialGenerator())
print(d12.textualDescription)

//同样，`SnakesAndLadders` 类也可以通过扩展遵循并符合 `TextRepresentable` 协议
extension SnakesAndLadders: TextRepresentable{
    
    var textualDescription:String {
        
        return "A game of Snakes and Ladders with \(finalSquare) squares"
        
    }
}

let game = SnakesAndLadders()
print(game.textualDescription)



//--------------------------------通过扩展遵循协议----------------------
//当一个类型已经符合了某个协议中的所有要求，却还没有声明遵循该协议时，可以通过空扩展体的扩展来遵循该协议

struct Hamster{
    var name: String
    var textualDescription:String {
        
        return "A hamster named \(name)"
        
    }
    
}

extension Hamster: TextRepresentable{
    
}

let somonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable:TextRepresentable = somonTheHamster
print(somethingTextRepresentable.textualDescription)

// 即使满足了协议的所有要求，类型也不会自动遵循协议，必须显式地遵循协议




//----------------------------协议类型的集合----------------------------
//协议类型可以在数组或者字典这样的集合中使用，在[协议类型](./22_Protocols.html##protocols_as_types)提到了这样的用法。下面的例子创建了一个元素类型为 `TextRepresentable` 的数组

let things: [TextRepresentable] = [game,d12,somonTheHamster]

//如下所示，可以遍历 `things` 数组，并打印每个元素的文本表示：
for thing in things{
    print(thing.textualDescription)
}


//`thing` 是 `TextRepresentable` 类型而不是 `Dice`，`DiceGame`，`Hamster` 等类型，即使实例在幕后确实是这些类型中的一种。由于 `thing` 是 `TextRepresentable` 类型，任何 `TextRepresentable` 的实例都有一个 `textualDescription` 属性，所以在每次循环中可以安全地访问 `thing.textualDescription`。






//----------------------------协议的继承 ------------------------------

//协议能够*继承*一个或多个其他协议，可以在继承的协议的基础上增加新的要求。协议的继承语法与类的继承相似，多个被继承的协议间用逗号分隔
protocol InheritingProtocol: SomeProtocol,AnotherProtocol{
    
    //这里是协议的定义部分
}

//如下所示，`PrettyTextRepresentable` 协议继承了 `TextRepresentable` 协议：
protocol PrettyTextRrepresentable: TextRepresentable{
    
    var prettyTextualDescription: String {
        get
    }
}


//例子中定义了一个新的协议 `PrettyTextRepresentable`，它继承自 `TextRepresentable` 协议。任何遵循 `PrettyTextRepresentable` 协议的类型在满足该协议的要求时，也必须满足 `TextRepresentable` 协议的要求。在这个例子中，`PrettyTextRepresentable` 协议额外要求遵循协议的类型提供一个返回值为 `String` 类型的 `prettyTextualDescription` 属性。

extension SnakesAndLadders: PrettyTextRrepresentable{
    
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        
        return output
    }
}
print(game.prettyTextualDescription)




//----------------------------类类型专属协议----------------------------
//你可以在协议的继承列表中，通过添加 `class` 关键字来限制协议只能被类类型遵循，而结构体或枚举不能遵循该协议。`class` 关键字必须第一个出现在协议的继承列表中，在其他继承的协议之前：
protocol SomeClassOnlyProtocol: class, InheritingProtocol {
    // 这里是类类型专属协议的定义部分
}
//在以上例子中，协议 `SomeClassOnlyProtocol` 只能被类类型遵循。如果尝试让结构体或枚举类型遵循该协议，则会导致编译错误





//----------------------------协议合成----------------------------
//
//有时候需要同时遵循多个协议，你可以将多个协议采用 `SomeProtocol & AnotherProtocol` 这样的格式进行组合，称为 *协议合成（protocol composition）*。你可以罗列任意多个你想要遵循的协议，以与符号(`&`)分隔。

protocol Named{
    var name:String { get }
}

protocol Aged{
    var age: Int {
        get
    }
}


struct Person1: Named,Aged{
    var name: String
    var  age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged){
    
    print(" Happy Birthday, \(celebrator.name),you're \(celebrator.age)!")
}

let birthdayPerson = Person1(name: "Malcolm", age: 25)
wishHappyBirthday(to: birthdayPerson)
//协议合成并不会生成新的、永久的协议类型，而是将多个协议中的要求合成到一个只在局部作用域有效的临时协议中


//----------------------------检查协议一致性----------------------------
//你可以使用[类型转换](./20_Type_Casting.html)中描述的 `is` 和 `as` 操作符来检查协议一致性，即是否符合某协议，并且可以转换到指定的协议类型。检查和转换到某个协议类型在语法上和类型的检查和转换完全相同
// * `is` 用来检查实例是否符合某个协议，若符合则返回 `true`，否则返回 `false`。
//* `as?` 返回一个可选值，当实例符合某个协议时，返回类型为协议类型的可选值，否则返回 `nil`。
//* `as!` 将实例强制向下转换到某个协议类型，如果强转失败，会引发运行时错误。

protocol HasArea{
    var area: Double { get }
    
}

class Circle: HasArea{
    
    let pi = 3.1415927
    var redius: Double
    var area: Double{
      return pi * redius * redius
    }
    init(redius: Double) {
        self.redius = redius
    }
}


class Country: HasArea{
    var area: Double
    init(area: Double) {
        self.area = area
    }
}

class Aniaml{
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
    
}

let objects:[AnyObject] = [Circle(redius: 2.0),Country(area: 234_610),Aniaml(legs: 4)]
for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    }else{
        print("Something that dosen't have an area")
    }
}






//----------------------------可选的协议要求----------------------------
//协议可以定义*可选要求*，遵循协议的类型可以选择是否实现这些要求。在协议中使用 `optional` 关键字作为前缀来定义可选要求。可选要求用在你需要和 Objective-C 打交道的代码中。协议和可选要求都必须带上`@objc`属性。标记 `@objc` 特性的协议只能被继承自 Objective-C 类的类或者 `@objc` 类遵循，其他类以及结构体和枚举均不能遵循这种协议。


//使用可选要求时（例如，可选的方法或者属性），它们的类型会自动变成可选的。比如，一个类型为 `(Int) -> String` 的方法会变成 `((Int) -> String)?`。需要注意的是整个函数类型是可选的，而不是函数的返回值。


//协议中的可选要求可通过可选链式调用来使用，因为遵循协议的类型可能没有实现这些可选要求。类似 `someOptionalMethod?(someArgument)` 这样，你可以在可选方法名称后加上 `?` 来调用可选方法。详细内容可在[可选链式调用](./17_Optional_Chaining.html)章节中查看。

//下面的例子定义了一个名为 `Counter` 的用于整数计数的类，它使用外部的数据源来提供每次的增量。数据源由 `CounterDataSource` 协议定义，包含两个可选要求：


@objc protocol CounterDataSource {
    @objc optional func incrementForCount(count:Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}


//`CounterDataSource` 协议定义了一个可选方法 `increment(forCount:)` 和一个可选属性 `fiexdIncrement`，它们使用了不同的方法来从数据源中获取适当的增量值。

//> 注意
//> 严格来讲，`CounterDataSource` 协议中的方法和属性都是可选的，因此遵循协议的类可以不实现这些要求，尽管技术上允许这样做，不过最好不要这样写。


class Counter {
    var count: Int = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.incrementForCount?(count:count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}


//`Counter` 类使用变量属性 `count` 来存储当前值。该类还定义了一个 `increment` 方法，每次调用该方法的时候，将会增加 `count` 的值。
//
//`increment()` 方法首先试图使用 `increment(forCount:)` 方法来得到每次的增量。`increment()` 方法使用可选链式调用来尝试调用 `increment(forCount:)`，并将当前的 `count` 值作为参数传入。
//
//这里使用了两层可选链式调用。首先，由于 `dataSource` 可能为 `nil`，因此在 `dataSource` 后边加上了 `?`，以此表明只在 `dataSource` 非空时才去调用 `increment(forCount:)` 方法。其次，即使 `dataSource` 存在，也无法保证其是否实现了 `increment(forCount:)` 方法，因为这个方法是可选的。因此，`increment(forCount:)` 方法同样使用可选链式调用进行调用，只有在该方法被实现的情况下才能调用它，所以在 `increment(forCount:)` 方法后边也加上了 `?`。
//
//
//调用 `increment(forCount:)` 方法在上述两种情形下都有可能失败，所以返回值为 `Int?` 类型。虽然在 `CounterDataSource` 协议中，`increment(forCount:)` 的返回值类型是非可选 `Int`。另外，即使这里使用了两层可选链式调用，最后的返回结果依旧是单层的可选类型。关于这一点的更多信息，请查阅[连接多层可选链式调用](./17_Optional_Chaining)
//
//在调用 `increment(forCount:)` 方法后，`Int?` 型的返回值通过可选绑定解包并赋值给常量 `amount`。如果可选值确实包含一个数值，也就是说，数据源和方法都存在，数据源方法返回了一个有效值。之后便将解包后的 `amount` 加到 `count` 上，增量操作完成。
//
//如果没有从 `increment(forCount:)` 方法获取到值，可能由于 `dataSource` 为 `nil`，或者它并没有实现 `increment(forCount:)` 方法，那么 `increment()` 方法将试图从数据源的 `fixedIncrement` 属性中获取增量。`fixedIncrement` 是一个可选属性，因此属性值是一个 `Int?` 值，即使该属性在 `CounterDataSource` 协议中的类型是非可选的 `Int`。
//
//下面的例子展示了 `CounterDataSource` 的简单实现。`ThreeSource` 类遵循了 `CounterDataSource` 协议，它实现了可选属性 `fixedIncrement`，每次会返回 `3`：

class ThreeSource: NSObject, CounterDataSource{
    let  fixedIncrement = 3
    
}

var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}
//上述代码新建了一个 `Counter` 实例，并将它的数据源设置为一个 `ThreeSource` 的实例，然后调用 `increment()` 方法四次。和预期一样，每次调用都会将 `count` 的值增加 `3`.

//下面是一个更为复杂的数据源 `TowardsZeroSource`，它将使得最后的值变为 `0`：

@objc class TowardsZeroSource: NSObject, CounterDataSource{
    func increment1(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        }else if count < 0{
            return 1
        }else{
            return -1
        }
    }
}
//`TowardsZeroSource` 实现了 `CounterDataSource` 协议中的 `increment(forCount:) ` 方法，以 `count` 参数为依据，计算出每次的增量。如果 `count` 已经为 `0`，此方法返回 `0`，以此表明之后不应再有增量操作发生。

//你可以使用 `TowardsZeroSource` 实例将 `Counter` 实例来从 `-4` 增加到 `0`。一旦增加到 `0`，数值便不会再有变动：

counter.dataSource = TowardsZeroSource()
counter.count = -4

for _ in 1...4 {
    counter.increment()
    print(counter.count)
}


//----------------------------协议扩展----------------------------

//协议可以通过扩展来为遵循协议的类型提供属性、方法以及下标的实现。通过这种方式，你可以基于协议本身来实现这些功能，而无需在每个遵循协议的类型中都重复同样的实现，也无需使用全局函数。
//
//例如，可以扩展 `RandomNumberGenerator` 协议来提供 `randomBool()` 方法。该方法使用协议中定义的 `random()` 方法来返回一个随机的 `Bool` 值：

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

//extension PrettyTextRepresentable  {
//    var prettyTextualDescription: String {
//        return textualDescription
//    }
//}

//----------------------------为协议扩展添加限制条件----------------------------
//在扩展协议的时候，可以指定一些限制条件，只有遵循协议的类型满足这些限制条件时，才能获得协议扩展提供的默认实现。这些限制条件写在协议名之后，使用 `where` 子句来描述，正如[Where子句](./23_Generics.html#where_clauses)中所描述的。
extension Collection where Iterator.Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}
let murrayTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "Morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]
print(hamsters.textualDescription)


//如果多个协议扩展都为同一个协议要求提供了默认实现，而遵循协议的类型又同时满足这些协议扩展的限制条件，那么将会使用限制条件最多的那个协议扩展提供的默认实现。
