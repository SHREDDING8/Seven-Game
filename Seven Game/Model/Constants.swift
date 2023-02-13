//
//  Constants.swift
//  Seven Game
//
//  Created by SHREDDING on 08.09.2022.
//

import Foundation
import UIKit

// settings Constants

public let settingsLocalizeKeyTable = "Settings"

// background

public let backroundImage = UIImage(named: "bg4")

// Game Mode


public let modeKeys:[Mode:[String:String]] = [
    .Default: ["title":"classicModeTitle", "description": "classicModeDescriptionSettings"],
    .Extended: ["title":"expertModeTitle", "description": "expertModeDescriptionSettings"],

]


public var currentGameMode:Mode = .Default
