//: Playground - noun: a place where people can play

import UIKit


//------枚举------
enum Rank: Int{
    
    case Ace = 1
    case Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten
    case Jack,Queen,King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack :
            return "Jack"
        case .Queen :
            return "Queen"
        case .King :
            return "King"
            
 

        default:
            
            return String(self.rawValue)
            
        }
    }
}

let  ace = Rank.Ace
let aceRawValue = ace.rawValue



//練習：寫一個函數，通過比較它們的原始值來比較兩個`Rank`值。
func swape (number1: Rank, number2: Rank)->Int{
    
    if number1.rawValue > number2.rawValue {
        return number1.rawValue
    }else{
        return number2.rawValue
    }
}

 let maxNum = swape(number1:Rank.Five , number2: Rank.Four)

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

//枚舉的成員值是實際值，並不是原始值的另一種表達方法。實際上，如果原始值沒有意義，你不需要設置。

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
       
        }
    }
    
    func color() -> String {
        switch self {
        case .Spades,.Clubs:
            return "black"
        case.Hearts,.Diamonds:
            return "red"
   

        }
    }
    
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
let headtsColor = hearts.color()

/*
 給`Suit`添加一個`color`方法，對`spades`和`clubs`返回「black」，對`hearts`和`diamonds`返回「red」。

注意，有兩種方式可以引用`Hearts`成員：給`hearts`常量賦值時，枚舉成員`Suit.Hearts`需要用全名來引用，因為常量沒有顯式指定類型。在`switch`裡，枚舉成員使用縮寫`.Hearts`來引用，因為`self`的值已經知道是一個`suit`。已知變量類型的情況下你可以使用縮寫。
*/

//-----结构体--------
//使用`struct`來創建一個結構體。結構體和類有很多相同的地方，比如方法和構造器。它們之間最大的一個區別就是
//結構體是傳值，類是傳引用。
