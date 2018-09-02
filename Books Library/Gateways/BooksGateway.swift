//
//  BooksGateway.swift
//  Books Library
//
//  Created by Sylvan Ash on 02/09/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import Foundation

protocol BooksGateway {
    func fetchBooks(completion: @escaping (_ books: [Book], Error?) -> Void)
}


// TODO: Should the below properties, inits, and func logic be here on in a service?
class BooksGatewayImplementation: BooksGateway {
    fileprivate var booksGateway: BooksGateway
    
    init(booksGateway: BooksGateway) {
        self.booksGateway = booksGateway
    }
    
    func fetchBooks(completion: @escaping ([Book], Error?) -> Void) {
        // check cache
        //  - cache is static, so doesn't need to be injected
        //  - if data is in cache, call completion with data
        //  - if cache error or no data in cache, fetch from API
        // fetch from API
        //  - success:
        //      - save to cache
        //      - call completion with data
        //  - failure:
        //      - call completion with error
        
        booksGateway.fetchBooks { (books, error) in
            completion(books, error)
        }
    }
}
