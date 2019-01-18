//
//  CustomCollectionsTableViewController.swift
//  ShopifyChallenge2019
//
//  Created by Raymond Diamonds on 2019-01-09.
//  Copyright © 2019 Raymond Diamonds. All rights reserved.
//
//  Purpose - Main view controller to handle UI changes and API request

import UIKit

class CustomCollectionsTableViewController: UITableViewController {
    
    // Mark: Variables
    var collections = [Collection]()
    var currentCollectionID:String!
    
    // Mark: IBOutlet
    @IBOutlet var collectionsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Mark: Delegate
        collectionsTableView.delegate = self;
        
        // Mark: Datasource
        collectionsTableView.dataSource = self;
        
        let shopifyURL = "https://shopicruit.myshopify.com/admin/custom_collections.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
        
        ShopifyService.getCollections(url: shopifyURL) { (receivedCollections) in
            
            self.collections = receivedCollections
            self.collectionsTableView?.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.collections.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "collectionTableViewCell", for: indexPath) as! CustomCollectionTableViewCell

        let temp = self.collections[indexPath.row].name
        
        cell.collectionTitle.text = temp
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "displayProducts" {
            
            if let indexPath = collectionsTableView.indexPathForSelectedRow{
                var destinationVC = segue.destination as! CollectionViewController
                let id = collections[indexPath.row].id
                currentCollectionID = String(id)
                destinationVC.collectionID = currentCollectionID
                destinationVC.collectionName = collections[indexPath.row].name
            }
        }
    }

}
