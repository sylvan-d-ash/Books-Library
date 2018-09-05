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
    
    let configurator = BooksConfiguratorImplementation()
    var presenter: BooksPresenter!
    fileprivate let reuseIdentifier = "BookCollectionViewCell"
    fileprivate var loadingView: LoadingView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        configurator.configure(booksViewController: self)
        presenter.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.router.prepare(for: segue, sender: sender)
    }
}

// MARK:- UICollectionViewDataSource

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

// MARK:- UICollectionViewDelegateFlowLayout

extension BooksViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return presenter.getCellSize(size: collectionView.bounds)
    }
}

// MARK:- UICollectionViewDelegate

extension BooksViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelect(row: indexPath.row)
    }
}

// MARK:- BooksView

extension BooksViewController: BooksView {
    func showProgress() {
        loadingView = LoadingView(self.view, dimming: false).show()
    }
    
    func hideProgress() {
        loadingView?.terminate()
    }
    
    func refreshBooksView() {
        collectionView.reloadData()
    }
    
    func showError(_ title: String, message: String) {
        presentAlert(withTitle: title, and: message)
    }
    
}
