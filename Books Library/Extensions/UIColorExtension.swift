//
//  UIColorExtension.swift
//  Books Library
//
//  Created by Sylvan Ash on 03/09/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import UIKit

extension UIColor {
    /**
     Initialize a UIColor with RGBA values
     */
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    /**
     Initialize a UIColor with a hex string value
     */
    convenience init(hex: String) {
        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if cString.count != 6 {
            self.init(r: 0, g: 0, b: 0)
            return
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        self.init(
            r: CGFloat((rgbValue & 0xFF0000) >> 16),
            g: CGFloat((rgbValue & 0x00FF00) >> 8),
            b: CGFloat((rgbValue & 0x0000FF))
        )
    }
    
    class var libBackgroundColor: UIColor {
        return UIColor(hex: "#000000")
    }
    
}
