//
//  AppearanceCommand.swift
//  Books Library
//
//  Created by Sylvan Ash on 03/09/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import UIKit
import Foundation

struct InitializeAppearanceCommand: Command {
    func execute() {
        // status bar
        UIApplication.shared.statusBarStyle = .lightContent
        
        // navigation bar
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.tintColor = .white
        navigationBarAppearance.barTintColor = .libBackgroundColor
        navigationBarAppearance.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
}
