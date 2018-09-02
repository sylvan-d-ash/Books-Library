//
//  BooksConfigurator.swift
//  Books Library
//
//  Created by Sylvan Ash on 02/09/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import Foundation

protocol BooksConfigurator {
    func configure(booksViewController: BooksViewController)
}

class BooksConfiguratorImplementation: BooksConfigurator {
    func configure(booksViewController: BooksViewController) {
        let booksGateway = JSONFileBooksGateway() //StaticDataBooksGateway()
        let gateway = BooksGatewayImplementation(booksGateway: booksGateway)
        let presenter = BooksPresenterImplementation(view: booksViewController, booksGateway: gateway)
        
        booksViewController.presenter = presenter
    }
}
