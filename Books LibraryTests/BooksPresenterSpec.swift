//
//  BooksPresenterSpec.swift
//  Books LibraryTests
//
//  Created by Sylvan Ash on 03/09/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import Quick
import Nimble
@testable import Books_Library

class BooksPresenterSpec: QuickSpec {
    
    class BooksViewSpy: BooksView {
        var showProgressCalled = false
        var hideProgressCalled = false
        var refreshBooksViewCalled = false
        var errorTitle: String?
        var errorMessage: String?
        
        func showProgress() {
            showProgressCalled = true
        }
        
        func hideProgress() {
            hideProgressCalled = true
        }
        
        func refreshBooksView() {
            refreshBooksViewCalled = true
        }
        
        func showError(_ title: String, message: String) {
            errorTitle = title
            errorMessage = message
        }
    }
    
    class StaticBooksGatewaySpy: BooksGateway {
        var errorReturned: Error? = nil
        var results: [Book] = []
        
        func fetchBooks(completion: @escaping ([Book], Error?) -> Void) {
            completion(results, errorReturned)
        }
    }
    
    class BooksViewRouterSpy: BooksViewRouter {
        var passedBook: Book?
        
        func presentDetailsView(for book: Book) {
            passedBook = book
        }
    }
    
    override func spec() {
        var sut: BooksPresenterImplementation!
        let booksViewSpy = BooksViewSpy()
        let booksGatewaySpy = StaticBooksGatewaySpy()
        let booksViewRouterSpy = BooksViewRouterSpy()
        
        beforeEach {
            sut = BooksPresenterImplementation(view: booksViewSpy, booksGateway: booksGatewaySpy, router: booksViewRouterSpy)
        }
        
        describe("viewDidLoad") {
            let books: [Book] = []
            
            context("success") {
                it("calls refreshData") {
                    // given
                    booksGatewaySpy.results = books
                    
                    // when
                    sut.viewDidLoad()
                    
                    // then
                    expect(booksViewSpy.showProgressCalled).to(equal(true))
                    expect(booksViewSpy.hideProgressCalled).to(equal(true))
                    expect(booksViewSpy.refreshBooksViewCalled).to(equal(true))
                }
                
                it("has a specific number of books") {
                    // given
                    let expectedNumberOfBooks = books.count
                    booksGatewaySpy.results = books
                    
                    // when
                    sut.viewDidLoad()
                    
                    // then
                    expect(sut.numberOfBooks).to(equal(expectedNumberOfBooks))
                }
            }
            
            context("failure") {
                it("displays error message and title") {
                    // given
                    let errorTitle = "Error"
                    let errorMessage = "Error fetching data"
                    booksGatewaySpy.errorReturned = NSError.createError(withMessage: errorMessage)
                    
                    // when
                    sut.viewDidLoad()
                    
                    // then
                    expect(booksViewSpy.showProgressCalled).to(equal(true))
                    expect(booksViewSpy.hideProgressCalled).to(equal(true))
                    expect(booksViewSpy.errorTitle).to(equal(errorTitle))
                    expect(booksViewSpy.errorMessage).to(equal(errorMessage))
                }
            }
        }
        
        describe("configure cell") {
            it("displays expected data") {
                fail()
            }
        }
        
        describe("didSelect") {
            it("navigates to details view") {
                fail()
            }
        }
    }
}
