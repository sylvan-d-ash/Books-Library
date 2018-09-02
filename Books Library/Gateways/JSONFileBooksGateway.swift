//
//  JSONFileBooksGateway.swift
//  Books Library
//
//  Created by Sylvan Ash on 02/09/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import Foundation

class JSONFileBooksGateway: BooksGateway {
    func fetchBooks(completion: @escaping ([Book], Error?) -> Void) {
        // fetch from JSON file
        if let url = Bundle.main.url(forResource: "books", withExtension: "json") {
            do {
                // process to an array of books
                let data = try Data(contentsOf: url)
                let books = try JSONDecoder().decode([Book].self, from: data)
                
                // return books
                completion(books, nil)
            } catch {
                // return error
                print(error.localizedDescription)
                completion([], error)
            }
        } else {
            // return error
            completion([], nil)
        }
    }
}
