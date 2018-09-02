//
//  BooksViewRouter.swift
//  Books Library
//
//  Created by Sylvan Ash on 02/09/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import UIKit

protocol BooksViewRouter: ViewRouter {
    func presentDetailsView(for book: Book)
}


class BooksViewRouterImplementation: BooksViewRouter {
    fileprivate unowned let booksViewController: BooksViewController
    fileprivate var book: Book!
    fileprivate let detailsSceneIdentifier = "BooksSceneToBookDetailsSceneSegue"
    
    init(booksViewController: BooksViewController) {
        self.booksViewController = booksViewController
    }
    
    
    func presentDetailsView(for book: Book) {
        self.book = book
        booksViewController.performSegue(withIdentifier: detailsSceneIdentifier, sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //
    }
}
