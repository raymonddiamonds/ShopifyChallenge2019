//
//  ShopifyService.swift
//  ShopifyChallenge2019
//
//  Created by Raymond Diamonds on 2019-01-09.
//  Copyright © 2019 Raymond Diamonds. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ShopifyService {
    
    static func getCollections(url: String, completionHandler: @escaping ([Collection])-> Void) {
        
        guard let url = URL(string: url) else { return }
        
        Alamofire.request(url, encoding: URLEncoding.default).responseJSON { (response) in
            
            var collectionArr = [Collection]()
            
            switch response.result {
                
            case.success:
                //optional binding to check response value
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    
                    if let collections = json["custom_collections"].array {
                        for collection in collections {

                            let title = collection["title"].stringValue
                            let id = collection["id"].int
                            
                            let collec = Collection(name: title, id: id!)

                            // add both arrays together
                            collectionArr.append(collec)
                        }
                    }
                }
                
            case.failure(let error):
                print(error)
            }

            completionHandler(collectionArr)
        }
    }
    
    static func getProductIds(url: String, completionHandler: @escaping ([Int])-> Void) {
        
        guard let url = URL(string: url) else { return }
        
        Alamofire.request(url, encoding: URLEncoding.default).responseJSON { (response) in
            
            var productIDs = [Int]()
            
            switch response.result {
                
            case.success:
                //optional binding to check response value
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    if let collections = json["collects"].array {
                        for products in collections {
                            
                            let id = products["product_id"].int
                            
                            productIDs.append(id!)
                        }
                    }
                }
                
            case.failure(let error):
                print(error)
            }
            
            completionHandler(productIDs)
        }
        
        
    }
    
    static func getProducts(url: String, completionHandler: @escaping ([Product])-> Void) {
        
        guard let url = URL(string: url) else { return }
        
        Alamofire.request(url, encoding: URLEncoding.default).responseJSON { (response) in
            
            var allProducts = [Product]()
            
            switch response.result {
                
            case.success:
                //optional binding to check response value
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    if let products = json["products"].array {
                        for product in products {
                            
                            let id = product["id"].int
                            let title = product["title"].stringValue
                            
                            let imageURL = product["images"][0]["src"].stringValue
                            let inventoryCount = product["variants"][0]["inventory_quantity"].int
                            let price = product["variants"][0]["price"].stringValue
                            
                            let product = Product(id: id!, title: title, imageURL: imageURL, inventoryCount: inventoryCount!, price: price)
                            
                            allProducts.append(product)
                        }
                    }
                }
                
            case.failure(let error):
                print(error)
            }
            
            completionHandler(allProducts)
        }
    }
    
    
    
}


