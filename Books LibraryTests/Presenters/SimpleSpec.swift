//
//  SimpleSpec.swift
//  Books LibraryTests
//
//  Created by Sylvan Ash on 01/11/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import Quick
import Nimble
@testable import Books_Library

class SimpleSpec: QuickSpec {
    
    class <#name#>: <#super class#> {
        <#code#>
    }
    
    override func spec() {
        describe("did select book") {
            var sut: BooksPresenterImplementation!
            let router = BooksViewRouterImplementation(booksViewController: BooksViewController())
            
            beforeEach {
                
            }
            
            it("should navigate to book detail view") {
                // given
                sut.books = [
                    Book(id: "123", isbn: "123", title: "qwer", author: "ewrwe", releaseDate: Date(), pages: 2, language: "afds", summary: "adfad", image: "afdaf"),
                    Book(id: "123", isbn: "123", title: "qwer", author: "ewrwe", releaseDate: Date(), pages: 2, language: "afds", summary: "adfad", image: "afdaf"),
                    Book(id: "123", isbn: "123", title: "qwer", author: "ewrwe", releaseDate: Date(), pages: 2, language: "afds", summary: "adfad", image: "afdaf")
                ]
                
                // when
                sut.didSelect(row: 1)
                
                // then
                router.
            }
        }
    }
}
