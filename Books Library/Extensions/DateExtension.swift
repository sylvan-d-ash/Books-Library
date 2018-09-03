//
//  DateExtension.swift
//  Books Library
//
//  Created by Sylvan Ash on 03/09/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import Foundation

extension Date {
    /**
     Get a string representation of the date
     
     - paremeter format: the format of the string date
     - returns: string representation of the date
     */
    func toString(_ format: String = "MMM d yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
}
