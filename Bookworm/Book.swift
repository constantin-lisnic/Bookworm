//
//  Book.swift
//  Bookworm
//
//  Created by Constantin Lisnic on 10/12/2024.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    var date = Date.now
    
    init(title: String, genre: String, author: String, review: String, rating: Int) {
        self.title = title
        self.genre = genre
        self.author = author
        self.rating = rating
        self.review = review
    }
}
