//
//  BookDetailsPresenterSpec.swift
//  Books LibraryTests
//
//  Created by Sylvan Ash on 05/09/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import Quick
import Nimble
@testable import Books_Library

class BookDetailsPresenterSpec: QuickSpec {
    
    class BookDetailsViewSpy: BookDetailsView {
        var displayedTitle = ""
        var displayedAuthor = ""
        var displayedPages = ""
        var displayedIsbn = ""
        var displayedLanguage = ""
        var displayedReleaseDate = ""
        var displayedImageName = ""
        var displayedSummary = ""
        
        func displayScreenTitle(title: String) {}
        
        func display(title: String, author: String) {
            displayedTitle = title
            displayedAuthor = author
        }
        
        func display(imageName: String) {
            displayedImageName = imageName
        }
        
        func display(pages: String, releaseDate: String, isbn: String, language: String) {
            displayedPages = pages
            displayedReleaseDate = releaseDate
            displayedIsbn = isbn
            displayedLanguage = language
        }
        
        func display(summary: String) {
            displayedSummary = summary
        }
    }
    
    override func spec() {
        var sut: BookDetailsPresenterImplementation!
        let bookDetailsViewSpy = BookDetailsViewSpy()
        var book: Book!
        
        beforeEach {
            book = Book(id: "1", isbn: "BK001", title: "A Game of Thrones", author: "George R. R. Martin", releaseDate: Date(), pages: 500, language: "English", summary: "...", image: "A Game of Thrones")
            sut = BookDetailsPresenterImplementation(view: bookDetailsViewSpy, book: book)
        }
        
        describe("viewDidLoad") {
            context("book information") {
                it("displays correct book information") {
                    // given
                    let expectedTitle = book.title
                    let expectedAuthor = book.author
                    let expectedImageName = book.image
                    let expectedIsbn = book.isbn
                    let expectedPages = "\(book.pages)"
                    let expectedLanguage = book.language
                    let expectedSummary = book.summary
                    let expectedReleaseDate = book.releaseDate.toString()
                    
                    // when
                    sut.viewDidLoad()
                    
                    // then
                    expect(bookDetailsViewSpy.displayedTitle).to(equal(expectedTitle))
                    expect(bookDetailsViewSpy.displayedAuthor).to(equal(expectedAuthor))
                    expect(bookDetailsViewSpy.displayedImageName).to(equal(expectedImageName))
                    expect(bookDetailsViewSpy.displayedIsbn).to(equal(expectedIsbn))
                    expect(bookDetailsViewSpy.displayedPages).to(equal(expectedPages))
                    expect(bookDetailsViewSpy.displayedLanguage).to(equal(expectedLanguage))
                    expect(bookDetailsViewSpy.displayedSummary).to(equal(expectedSummary))
                    expect(bookDetailsViewSpy.displayedReleaseDate).to(equal(expectedReleaseDate))
                }
            }
        }
    }
}
