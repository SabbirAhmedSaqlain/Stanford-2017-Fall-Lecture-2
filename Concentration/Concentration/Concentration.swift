//
//  Concentration.swift
//  Concentration
//
//  Created by Sabbir Ahmed on 5/9/18.
//  Copyright © 2018 Sabbir  Ahmed. All rights reserved.
//

import Foundation

class Concentration{
    
   // var cards = Array<Card>()  or
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    
    func chooseCard(at index: Int){
     /*    if cards[index].isFaceUp{
            cards[index].isFaceUp = false
        }else {
             cards[index].isFaceUp = true
        }*/
        
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil

                
                
            }else{
                
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
                
                
                
            }
        }
        
        
        
        
    }
    
    
    init(numberOfPairOfCards: Int) {
        
        for _ in 0..<numberOfPairOfCards{
            
             let card = Card()
            // let matchingCard = card
         //    cards.append(card)
          //   cards.append(matchingCard)   or
            
            cards += [card,card]

            
            
        }
       
        
        
        
        
    }
    
    
    
}






















