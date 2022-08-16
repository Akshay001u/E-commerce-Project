//
//  SecondViewController.swift
//  E-commerce Project
//
//  Created by Akshay on 16/08/22.
//

import UIKit

import CoreData
import SDWebImage

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
 
    var datafetch : FetchedData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let image: NSURL? = NSURL(string: "\((datafetch?.postImage)!)")
        guard let imgUrl = image else { return }
        imageView.sd_setImage(with: imgUrl as URL)
        idLabel.text = "\((datafetch?.postId)!)"
        titleLabel.text = datafetch?.postTitle
        descriptionLabel.text = datafetch?.postDescription
        categoryLabel.text = datafetch?.postCategory
        ratingLabel.text = "\((datafetch?.postRating)!)"
        priceLabel.text = "\((datafetch?.postPrice)!)"
        countLabel.text = "\((datafetch?.postCount)!)"
    }
    
    @IBAction func addWishlistItems(_ sender: Any) {
        let wishlistImage = datafetch?.postImage
        let wishlistId = (datafetch?.postId)!
        let wishlistTitle = datafetch?.postTitle
        let wishlistDescription = datafetch?.postDescription
        let wishlistCategory = datafetch?.postCategory
        let wishlistRating = "\((datafetch?.postRating)!)"
        let wishlistPrice = "\((datafetch?.postPrice)!)"
        let wishlistCount = "\((datafetch?.postCount)!)"
        
        
        DatabaseHandler.shared.saveData(postObject: Post(postImage: wishlistImage, postId: Int(wishlistId), postTitle: wishlistTitle, postPrice: Float(wishlistPrice), postDescription: wishlistDescription, postCategory: wishlistCategory, postRating: Float(wishlistRating), postCount: Int(wishlistCount)))
        
        
        let alertController = UIAlertController(title: "", message: "Added to Wishlist", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
        
       }
    
}
