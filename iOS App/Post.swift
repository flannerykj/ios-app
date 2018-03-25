//
//  Post.swift
//  iOS App
//
//  Created by Flannery Jefferson on 2018-03-24.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation
import UIKit

class Post {
    var title: String
    var user: User
    var body: String
    var category: String
    var datePublished: Date
    var image: UIImage
    
    init(title: String, user: User, body: String, category: String, datePublished: Date, image: UIImage) {
        self.title = title
        self.user = user
        self.body = body
        self.category = category
        self.datePublished = datePublished
        self.image = image
    }
}
