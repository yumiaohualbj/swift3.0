//: Playground - noun: a place where people can play

import UIKit

//----------使用可选链式调用代替强制展开--------------
/*class Person{
    
    var  residence: Residence?
    
}

class Residence{
    
    var numberOfRooms = 1
    
}

let john = Person()
john.residence = Residence()

if  let roomCount = john.residence?.numberOfRooms {
    print("john's residence has \(roomCount) rooms(s)" )
}else{
    print("Unable to retrieve the number of rooms." )
}
*/

//-----------为可选链式调用定义模型类----------
//通过使用可选链式调用可以调用多层属性、方法和下标。这样可以在复杂的模型中向下访问各种子属性，并且判断能否访问子属性的属性、方法或下标。


class Person{
    
    var  residence: Residence?
  
}

class Residence{
    
    var rooms = [Room]()
    var numberOfRooms :Int{
        
        return rooms.count
    }
    
    subscript(i:Int)-> Room{
        
        get{
            
            return rooms[i]
        }
        set {
            
            rooms[i] = newValue
            
        }
        
    }
    
    func printNumberOfRooms() {
        
        print("The number of rooms is \(numberOfRooms)")
    }
    
    var address: Address?
    
}

class Room{
    let name: String
    init(name: String) {
        self.name = name
    }
    
}

class Address{
    
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        }else if buildingNumber != nil && street != nil{
            return "\(buildingNumber) \(street)"
        }else{
            return nil
        }
    }
    
}

let john = Person()
if let roomCount = john.residence?.numberOfRooms   {
    
print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress

