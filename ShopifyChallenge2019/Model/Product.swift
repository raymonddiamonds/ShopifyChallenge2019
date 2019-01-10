//
//  Product.swift
//  ShopifyChallenge2019
//
//  Created by Raymond Diamonds on 2019-01-09.
//  Copyright © 2019 Raymond Diamonds. All rights reserved.
//

import Foundation

struct Product {
    
    var id: Int
    var title: String
    var imageURL: String
    var inventoryCount: Int
    var price: String
    
    init(id: Int, title: String, imageURL: String, inventoryCount: Int, price: String) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
        self.inventoryCount = inventoryCount
        self.price = price
        
    }
}
