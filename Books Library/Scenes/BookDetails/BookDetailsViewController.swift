//
//  BookDetailsViewController.swift
//  Books Library
//
//  Created by Sylvan Ash on 02/09/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import UIKit

class BookDetailsViewController: UIViewController {
    var presenter: BookDetailsPresenter!
    var configurator: BookDetailsConfigurator!
    
    @IBOutlet weak var pagesLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var isbnLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(bookDetailsViewController: self)
        presenter.viewDidLoad()
    }
}

extension BookDetailsViewController: BookDetailsView {
    func displayScreenTitle(title: String) {
        self.title = title
    }
    
    func display(title: String, author: String) {
        titleLabel.text = title
        authorLabel.text = author
    }
    
    func display(imageName: String) {
        if let image = UIImage(named: imageName) {
            coverImageView.image = image
        }
    }
    
    func display(pages: String, releaseDate: String, isbn: String, language: String) {
        pagesLabel.text = pages
        releaseDateLabel.text = releaseDate
        isbnLabel.text = isbn
        languageLabel.text = language
    }
    
    func display(summary: String) {
        // make this attributed text
        summaryLabel.text = summary
    }
}
