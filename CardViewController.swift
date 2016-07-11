//
//  CardViewController.swift
//  DeckOfOneCard
//
//  Created by Patrick Ridd on 7/11/16.
//  Copyright © 2016 PatrickRidd. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var ourImageView: UIImageView!

    
    
    // MARK: Action Buttons
    
    @IBAction func drawButtonTapped(sender: AnyObject) {
        CardController.drawCards(1) { (cardArray) in
            guard let card = cardArray.first else { return }
            
            ImageController.imageForURL(card.imageURL, completion: { (image) in
                guard let image = image else {
                    return
                }
                self.ourImageView.image = image
            })
        }
    }
    
    
    
}
