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

// Language
public let userDefaultsKeyForLanguage = "Language"

public var currentLanguage:Language = .Russian


public let languages:[Language] = [Language.Russian,Language.English]

// background

public let backroundImage = UIImage(named: "background2")

// Game Mode


public let modeKeys:[Mode:[String:String]] = [
    .Default: ["title":"classicModeTitle", "description": "classicModeDescriptionSettings"],
    .Extended: ["title":"expertModeTitle", "description": "expertModeDescriptionSettings"],

]


public var currentGameMode:Mode = .Default
