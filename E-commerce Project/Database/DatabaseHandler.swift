//
//  DatabaseHandler.swift
//  E-commerce Project
//
//  Created by Akshay on 16/08/22.
//

import Foundation
import CoreData
import UIKit

class DatabaseHandler{
    static var shared = DatabaseHandler()
    
    private init() {
        
    }
    
    var posts : [NSManagedObject] = []
    
    var image: UIImage?=nil
    
    //MARK: Insert data to CoreData
    
    func saveData(postObject: Post)  {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ProductList")
        fetchRequest.predicate = NSPredicate(format: "id = %d", postObject.postId!)
        
        var results: [NSManagedObject] = []
        
        do {
            results = try managedContext.fetch(fetchRequest)
            if results.count == 0 {
                let postEntity = NSEntityDescription.entity(forEntityName: "ProductList", in: managedContext)
                let post = NSManagedObject(entity: postEntity!, insertInto: managedContext)
                
                post.setValue(postObject.postImage, forKeyPath: "image")
                post.setValue(postObject.postId, forKeyPath: "id")
                post.setValue(postObject.postTitle, forKeyPath: "title")
                post.setValue(postObject.postPrice, forKeyPath: "price")
                post.setValue(postObject.postDescription, forKeyPath: "pdescription")
                post.setValue(postObject.postCategory, forKeyPath: "category")
                post.setValue(postObject.postRating, forKeyPath: "rating")
                post.setValue(postObject.postCount, forKeyPath: "count")
                
                do {
                    try managedContext.save()
                    posts.append(post)
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
            } else {
                //don't insert
            }
        } catch {
            print("error executing fetch request: \(error)")
        }
    }
    
    
    //MARK: Read data from CoreData
    
    func fetchPostsData() -> [NSManagedObject] {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let managedContext = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ProductList")
            do {
                posts = try managedContext.fetch(fetchRequest)
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
            return posts
        }
        return posts
    }
   
    
    func deleteObject(postObject: NSManagedObject) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext

        managedContext.delete(postObject)
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
        
}
