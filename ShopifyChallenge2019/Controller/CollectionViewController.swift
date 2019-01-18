//
//  CollectionViewController.swift
//  ShopifyChallenge2019
//
//  Created by Raymond Diamonds on 2019-01-09.
//  Copyright © 2019 Raymond Diamonds. All rights reserved.
//
//  Purpose - Sub view controller to handle UI changes and API request for products page

import UIKit
import Kingfisher

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    var ids = [Int]()
    var products = [Product]()
    var productsURL = ""
    var collectionID = ""
    
    var collectionName: String?
    
    @IBOutlet var detailsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        //MARK: Datasouce
        detailsCollectionView.dataSource = self
        //MARK: Delegate
        detailsCollectionView.delegate = self
        
        navigationItem.title = collectionName

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        let collectionURL = "https://shopicruit.myshopify.com/admin/collects.json?collection_id=\(collectionID)&page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
        
        ShopifyService.getProductIds(url: collectionURL) { (productIDs) in
            self.ids = productIDs
            
            var ids = ""
            
            for id in productIDs {
                let idS = String(id)
                if(ids.count == 0) {
                    ids = idS
                }
                // append ids for query string
                ids = ids+","+idS
            }
            self.productsURL = "https://shopicruit.myshopify.com/admin/products.json?ids=\(ids)&page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
            
            ShopifyService.getProducts(url: self.productsURL)  { (products) in
                self.products = products
                self.detailsCollectionView.reloadData()
            }
        }
    }
        
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailsCollectionCell", for: indexPath) as! DetailCollectionCell
        
        // Product information
        let title = products[indexPath.row].title
        let imageURL = products[indexPath.row].imageURL
        let count = products[indexPath.row].inventoryCount
        let price = products[indexPath.row].price
        let url = URL(string: imageURL)
        
        // Set product information
        cell.productLabel.text = title
        cell.priceLabel.text = "$\(price)"
        cell.countLabel.text = "\(String(count)) left in stock"
        cell.image.kf.setImage(with: url)
        
        return cell
    }
}
