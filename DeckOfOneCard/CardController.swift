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
    
    static func drawCards(numberOfCards: Int, completion: ((cardArray: [Card]) -> Void)) {
        
        guard let url = baseURL else {
            fatalError("URL optional is nil")
        }
        let urlParameters = ["count": "\(numberOfCards)"]
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            if let data = data, responseDataString = NSString(data: data, encoding: NSUTF8StringEncoding) {
                
                guard let jsonDictionary = try? NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String: AnyObject], cardsArray = jsonDictionary?["cards"] as? [[String: AnyObject]] else {
                    print("unable to serialize JSON. \n\(responseDataString)")
                    completion(cardArray: [])
                    return
                }
                let cards = cardsArray.flatMap { Card(dictionary: $0) }
                completion(cardArray: cards)
                
            } else {
                print("No Data returned from network request")
                completion(cardArray : [])
            }
        }
    }
}