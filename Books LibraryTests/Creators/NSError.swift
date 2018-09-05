//
//  NSError.swift
//  Books LibraryTests
//
//  Created by Sylvan Ash on 04/09/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import Foundation

extension NSError {
    static func createError(withMessage message: String) -> NSError {
        return NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
