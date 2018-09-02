//
//  BookCollectionViewCell.swift
//  Books Library
//
//  Created by Sylvan Ash on 02/09/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bookImageView: UIImageView!
    
    func display(image: UIImage) {
        bookImageView.image = image
    }
    
    func formatCell() {
    }
}
