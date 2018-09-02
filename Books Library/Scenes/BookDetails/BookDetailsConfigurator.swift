//
//  BookDetailsConfigurator.swift
//  Books Library
//
//  Created by Sylvan Ash on 02/09/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import Foundation

protocol BookDetailsConfigurator {
    func configure()
}

class BookDetailsConfiguratorImplementation: BookDetailsConfigurator {
    
    let book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    func configure() {
        //
    }
}
