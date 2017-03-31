//: Playground - noun: a place where people can play

import UIKit

func lengthOfLongestSubstring(_ s: String) -> Int {
    if(s.characters.count <= 1){return s.characters.count}
    
    let characters = s.characters
    var mapper = [Character:Int]()
    var repeatIdx = 0,maxLength = 0
    for(idx,ch) in characters.enumerated(){
        
        if let existIdx = mapper[ch]{
            maxLength = max(maxLength,idx - repeatIdx)
            repeatIdx = max(repeatIdx,existIdx + 1)
        }
        mapper[ch] = idx
    }
    maxLength = max(maxLength,s.characters.count - repeatIdx)
    return maxLength
}


let result  = lengthOfLongestSubstring("pwwkwew")

		