//
//  UIViewExtension.swift
//  Books Library
//
//  Created by Sylvan Ash on 03/09/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import UIKit

extension UIView {
    /**
     Round the corners of a view based on given corner radius
     
     - parameter radius: the radius of the corners
     */
    func roundCorners(_ radius: CGFloat = 5) {
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
}
