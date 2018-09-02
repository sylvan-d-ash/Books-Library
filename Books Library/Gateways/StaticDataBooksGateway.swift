//
//  StaticDataBooksGateway.swift
//  Books Library
//
//  Created by Sylvan Ash on 02/09/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import Foundation

class StaticDataBooksGateway: BooksGateway {
    func fetchBooks(completion: @escaping ([Book], Error?) -> Void) {
        var books = [Book]()
        books.append(Book(id: "1", isbn: "BK001", title: "A Game of Thrones", author: "George R. R. Martin", releaseDate: Date(), pages: 500, language: "English", summary: "...", imageUrl: ""))
        books.append(Book(id: "2", isbn: "BK002", title: "A Clash of Kings", author: "George R. R. Martin", releaseDate: Date(), pages: 554, language: "English", summary: "...", imageUrl: ""))
        books.append(Book(id: "3", isbn: "BK003", title: "A Clash of Kings", author: "George R. R. Martin", releaseDate: Date(), pages: 554, language: "English", summary: "...", imageUrl: ""))
        books.append(Book(id: "4", isbn: "BK004", title: "A Clash of Kings", author: "George R. R. Martin", releaseDate: Date(), pages: 554, language: "English", summary: "...", imageUrl: ""))
        books.append(Book(id: "5", isbn: "BK005", title: "A Clash of Kings", author: "George R. R. Martin", releaseDate: Date(), pages: 554, language: "English", summary: "...", imageUrl: ""))
        
        let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            completion(books, nil)
        }
    }
}
