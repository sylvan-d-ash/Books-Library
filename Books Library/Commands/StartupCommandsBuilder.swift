//
//  StartupCommandsBuilder.swift
//  Books Library
//
//  Created by Sylvan Ash on 03/09/2018.
//  Copyright © 2018 Sylvan Ash. All rights reserved.
//

import Foundation

protocol Command {
    func execute()
}

final class StartupCommandsBuilder {
    func build() -> [Command] {
        return [
            InitializeAppearanceCommand()
        ]
    }
}
