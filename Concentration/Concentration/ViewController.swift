//
//  ViewController.swift
//  Concentration
//
//  Created by Sabbir Ahmed on 5/9/18.
//  Copyright © 2018 Sabbir  Ahmed. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairOfCards: (cardButtons.count + 1) / 2 )
    var flipCount = 0 {didSet{flipCountLabel.text = "Flips: \(flipCount)"}}
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
  
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
            //flipCard(withEmoji: emojiChoice[cardNumber], on: sender)
            //print("Card number: \(cardNumber)")
        }else{
            print("Chosen card was not in card button")
        }

    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9372549057, green: 0.5120026372, blue: 0.07434374232, alpha: 0) : #colorLiteral(red: 0.9372549057, green: 0.5120026372, blue: 0.07434374232, alpha: 1)
            }
            
        }
    }
  
    var emojiChoice = ["🌲", "👻", "🎃", "🍞","🌽", "🍟", "🍳", "🍎"  ]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        
       if emoji[card.identifier] == nil, emojiChoice.count > 0 {

            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoice.count)))
            emoji[card.identifier] = emojiChoice.remove(at: randomIndex)
        }
 
        return emoji[card.identifier] ?? "?"
    }
 

    /*   if emoji[card.identifier] != nil {
     return emoji[card.identifier]!
     }else{
     return "?"
     }
     
     */
    
    
    
    
    
    
}

