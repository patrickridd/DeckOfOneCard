//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Patrick Ridd on 7/11/16.
//  Copyright © 2016 PatrickRidd. All rights reserved.
//

import Foundation

class CardController {
    
    static let baseURL = NSURL(string: "http://deckofcardsapi.com/api/deck/new/draw/")
    
    static func drawCards(numberOfCards: Int, completion: ((card: [Card]) -> Void)) {
        
    }
    
    
}