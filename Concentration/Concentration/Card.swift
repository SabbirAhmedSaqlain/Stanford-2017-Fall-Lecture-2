//
//  Card.swift
//  Concentration
//
//  Created by Sabbir Ahmed on 5/9/18.
//  Copyright © 2018 Sabbir  Ahmed. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
    
    
    
}



























