//
//  ViewController.swift
//  Books Library
//
//  Created by Sylvan Ash on 02/09/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let reuseIdentifier = "BookCollectionViewCell"
    var configurator = BooksConfiguratorImplementation()
    var presenter: BooksPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        configurator.configure(booksViewController: self)
        presenter.viewDidLoad()
    }

}

extension BooksViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfBooks
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BookCollectionViewCell
        presenter.configure(cell: cell, for: indexPath.row)
        
        return cell
    }
}

extension BooksViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return presenter.getCellSize(size: collectionView.bounds)
    }
}

extension BooksViewController: BooksView {
    func showProgress() {
        //
    }
    
    func hideProgress() {
        //
    }
    
    func refreshBooksView() {
        collectionView.reloadData()
    }
    
    func showError(_ title: String, message: String) {
        //
    }
    
    
}
