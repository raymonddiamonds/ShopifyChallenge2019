# Shopify iOS Intern Challenge - Summer 2019

One Paragraph of project description goes here

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

After cloning/downloading the project, go into the terminal and ```cd``` to the root of the project. 

Download the cocoapod dependencies
```
pod install
```

## Technical Aspects

The following describes the technical aspects of the project of how it was designed and built with various concepts in mind. 

### Design

The project was built using MVC architecture. 

**Model:** 
* Collection
  * collectionID
  * collectionName
  
* Product
  * id
  * name
  * price
  * count
  * imageURL
  
**View:**
The view contains the UI components that are visible to the user. This includes the ```UILabel``` and ```UIImageView```. There are two classes, ```CustomCollectionTableViewCell.swift``` (Collection list) and ```DetailCollectionCell.swift``` (Products) that represent the view. 

**Controller:**
The controller is the code that takes the user's action and updates the model and then updates the view. There are two controllers, ```CustomCollectionsTableViewController.swift``` (Collection list) and ```CollectionViewController.swift``` (Product Detail List). 

## Built With

* [Shopify REST API](https://shopicruit.myshopify.com/admin/custom_collections.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6) - Shopify Custom Collection REST API
* [Alamofire](https://github.com/Alamofire/Alamofire) - HTTP Networking library for Swift
* [SwiftyJSON](https://maven.apache.org/) - JSON parsing library for Swift
* [Kingfisher](https://github.com/onevcat/Kingfisher) - Swift Library used to download/cache images from the web

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Raymond Diamonds** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments
