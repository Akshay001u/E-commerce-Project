//
//  ThirdViewController.swift
//  E-commerce Project
//
//  Created by Akshay on 16/08/22.
//

import UIKit
import SDWebImage
import CoreData

class ThirdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var wishlistTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wishlistTableView.dataSource = self
        wishlistTableView.delegate = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DatabaseHandler.shared.fetchPostsData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = wishlistTableView.dequeueReusableCell(withIdentifier: "cell") as! WishlistTableViewCell
        let postObj = DatabaseHandler.shared.fetchPostsData()[indexPath.row]
        
        let tempImage = postObj.value(forKey: "image") as? String
        let tempId = postObj.value(forKey: "id") as? Int32
        let tempPrice = postObj.value(forKey: "price") as? Float
        let tempRating = postObj.value(forKey: "rating") as? Float
        let tempCount = postObj.value(forKey: "count") as? Int32
        
        
        cell.widLabel.text = String(tempId!)
        cell.wtitleLabel.text = postObj.value(forKey: "title") as? String
        cell.wpriceLabel.text = String(tempPrice!)
        cell.wdescriptionLabel.text = postObj.value(forKey: "pdescription") as? String
        cell.wcategoryLabel.text = postObj.value(forKey: "category") as? String
        cell.wratingLabel.text = String(tempRating!)
        cell.wcountLabel.text = String(tempCount!)
        
        let wImage: NSURL? = NSURL(string: "\(tempImage ?? "xyz")")
        cell.wimageView.sd_setImage(with: (wImage as URL?))
    
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        500
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postObj = DatabaseHandler.shared.fetchPostsData()[indexPath.row]
        _ = postObj.value(forKey: "image") as? String
        _ = postObj.value(forKey: "id") as? Int32
        _ = postObj.value(forKey: "price") as? Float
        _ = postObj.value(forKey: "rating") as? Float
        _ = postObj.value(forKey: "count") as? Int32
        _ = postObj.value(forKey: "title") as? String
        _ = postObj.value(forKey: "pdescription") as? String
        _ = postObj.value(forKey: "category") as? String
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let postObj = DatabaseHandler.shared.fetchPostsData()[indexPath.row]
        DatabaseHandler.shared.deleteObject(postObject: postObj)
        wishlistTableView.reloadData()
    }
}
