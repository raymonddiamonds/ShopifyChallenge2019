//
//  CollectionViewController.swift
//  ShopifyChallenge2019
//
//  Created by Raymond Diamonds on 2019-01-09.
//  Copyright © 2019 Raymond Diamonds. All rights reserved.
//

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

        
        detailsCollectionView.dataSource = self
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
        // #warning Incomplete implementation, return the number of items
        return products.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailsCollectionCell", for: indexPath) as! DetailCollectionCell
        
        let title = products[indexPath.row].title
        let imageURL = products[indexPath.row].imageURL
        let count = products[indexPath.row].inventoryCount
        let price = products[indexPath.row].price
        
        cell.productLabel.text = title
        cell.priceLabel.text = "$\(price)"
        cell.countLabel.text = "\(String(count)) left in stock"
        
        let url = URL(string: imageURL)
        cell.image.kf.setImage(with: url)
        
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
