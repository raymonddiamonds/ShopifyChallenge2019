//
//  Collection.swift
//  ShopifyChallenge2019
//
//  Created by Raymond Diamonds on 2019-01-09.
//  Copyright © 2019 Raymond Diamonds. All rights reserved.
//
//  Purpose - to provide model for collection

import Foundation


struct Collection {
    
    var name: String
    var id: Int
    
    init(name: String, id: Int) {
        self.id = id
        self.name = name
    }
    
}
