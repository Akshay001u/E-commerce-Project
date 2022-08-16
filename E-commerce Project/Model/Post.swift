//
//  Post.swift
//  E-commerce Project
//
//  Created by Akshay on 16/08/22.
//

import Foundation
struct Post {
    var postImage: String?
    var postId: Int?
    var postTitle: String?
    var postPrice: Float?
    var postDescription: String?
    var postCategory: String?
    var postRating: Float?
    var postCount: Int?

    
    init(postImage: String?, postId: Int?, postTitle: String?, postPrice: Float?, postDescription: String?, postCategory: String?, postRating: Float?, postCount: Int?) {
        self.postImage = postImage
        self.postId = postId
        self.postTitle = postTitle
        self.postPrice = postPrice
        self.postDescription = postDescription
        self.postCategory = postCategory
        self.postRating = postRating
        self.postCount = postCount
    }
}
