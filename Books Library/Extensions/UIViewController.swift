//
//  UIViewController.swift
//  Books Library
//
//  Created by Sylvan Ash on 05/09/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentAlert(withTitle title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}
