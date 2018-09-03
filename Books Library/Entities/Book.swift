//
//  Book.swift
//  Books Library
//
//  Created by Sylvan Ash on 02/09/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import Foundation

struct Book: Decodable {
    var id: String
    var isbn: String
    var title: String
    var author: String
    var releaseDate: Date
    var pages: Int
    var language: String
    var summary: String
    var image: String
}
