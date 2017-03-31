//: Playground - noun: a place where people can play

import Foundation

class Room{
  public  var people = [String](){
        didSet{
            
            
        }
    }
    
    
    public  func report() {
        if !people.isEmpty {
            for name in self.people {
                print("name is \(name)")
                print(" ")
            }
        }else{
            print("None people")
        }
       print("in the room.")
    }
    
    
}


class MeetingRoom: Room{
    
    var foodCost :Int{
        
        get{
            
            return people.count * 5
        }
    }
    
    
    override func report() {
        if !people.isEmpty {
            for name in self.people {
                print("name is \(name)")
                print(" ")
            }
        }else{
            print("None people")
        }
        
        print("in the meeting room.")
    }
}


let people = ["yu","miao","hua"]
let room = Room()
let meetingRoom = MeetingRoom()
room.people = people
room.report()
meetingRoom.people = people
meetingRoom.report()



		