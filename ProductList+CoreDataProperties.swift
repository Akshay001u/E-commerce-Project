//
//  ProductList+CoreDataProperties.swift
//  
//
//  Created by Akshay on 16/08/22.
//
//

import Foundation
import CoreData


extension ProductList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductList> {
        return NSFetchRequest<ProductList>(entityName: "ProductList")
    }

    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var price: Float
    @NSManaged public var pdescription: String?
    @NSManaged public var category: String?
    @NSManaged public var rating: Float
    @NSManaged public var count: Int32
    @NSManaged public var image: String?

}
