//
//  ViewController.swift
//  E-commerce Project
//
//  Created by Akshay on 16/08/22.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    
     @IBOutlet weak var dataTableView: UITableView!
     
     var postRating: Float!
     var postCount: Int!
     
     var fetchedData = [FetchedData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTableView.dataSource = self
        dataTableView.delegate = self
        apiData()
    }

    @IBAction func wishlistButton(_ sender: UIButton){
        let thirdViewController = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") as! ThirdViewController
        
        self.navigationController?.pushViewController(thirdViewController, animated: true)
    }
   
   func apiData() {
        let urlString = "https://fakestoreapi.com/products"
        guard let url = URL(string: urlString) else{
            print("URL Invalid")
            return
            }
            
            var request = URLRequest(url:url)
            request.httpMethod = "GET"
            
            let session = URLSession(configuration: .default)
            
            let dataTask = session.dataTask(with: request){(data, response, error) in
                
                guard let data = data else {
                    print("Data not found")
                    return
                }
                
                let getJsonObject = try? (JSONSerialization.jsonObject(with: data) as! [[String: Any]])
               
                for info in getJsonObject!
                {
                    let eachData = info as [String: Any]
                    let pId = eachData["id"] as! Int
                    let pTitle = eachData["title"] as! String
                    let pPrice = eachData["price"] as! NSNumber
                    let pDescription = eachData["description"] as! String
                    let pCategory = eachData["category"] as! String
                    let pImage = eachData["image"] as! String
                    if let rating = eachData["rating"] as? [String:Any]{
                        if let pRate = rating["rate"] as? NSNumber{
                            self.postRating = Float(truncating: pRate)
                        }
                        if let pCount = rating["count"] as? NSNumber{
                            self.postCount = Int(truncating: pCount)
                        }
                    }
                    let newData = FetchedData(postImage: pImage, postId: pId, postTitle: pTitle, postPrice: Float(truncating: pPrice), postDescription: pDescription, postCategory: pCategory, postRating: self.postRating, postCount: self.postCount)
                    self.fetchedData.append(newData)
                }
                DispatchQueue.main.async {
                    self.dataTableView.reloadData()
                }
            }
            dataTask.resume()
        }
       
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dataTableView.dequeueReusableCell(withIdentifier: "customCell") as! ProductTableViewCell
        cell.titleLabel.text = fetchedData[indexPath.row].postTitle
        cell.priceLabel.text = String(fetchedData[indexPath.row].postPrice)
        let img = fetchedData[indexPath.row].postImage
        
        let image: NSURL? = NSURL(string: "\(img)")
        cell.apiImageView.sd_setImage(with: image as! URL)
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondViewController = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        let dataPassToSVC = self.fetchedData[(dataTableView.indexPathForSelectedRow?.row)!]
        secondViewController.datafetch = dataPassToSVC
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}


