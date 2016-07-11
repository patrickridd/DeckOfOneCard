//
//  ImageController.swift
//  DeckOfOneCard
//
//  Created by Patrick Ridd on 7/11/16.
//  Copyright © 2016 PatrickRidd. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    
    static func imageForURL(url: String, completion: ((image: UIImage?) -> Void)) {
        
        guard let url = NSURL(string: url) else { fatalError("Image URL Optional is nil") }
        NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
            
            guard let data = data else {
                completion(image: nil)
                return
            }
            dispatch_async(dispatch_get_main_queue(), {
                completion(image: UIImage(data: data)) })
        }
    }
}