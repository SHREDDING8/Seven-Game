//
//  LanguageSettings.swift
//  Seven Game
//
//  Created by SHREDDING on 23.06.2022.
//

import Foundation
import UIKit

public enum Language:String{
    case Russian = "Русский"
    case English = "English"
}


protocol LanguageProtocol{
    
    func setLanguage(language:Language)
    func loadLanguage()
}


class LanguageSettings:LanguageProtocol{

    
    private let userDefaults =  UserDefaults.standard
    
    
    func setLanguage(language: Language) {
        userDefaults.set(language.rawValue, forKey: userDefaultsKeyForLanguage)
        currentLanguage = language
    }
    
    internal func loadLanguage() {
        let languageFromUserDefaults = userDefaults.string(forKey: userDefaultsKeyForLanguage)
        
        switch languageFromUserDefaults{
            case Language.Russian.rawValue:
                currentLanguage = .Russian
        case Language.English.rawValue:
            currentLanguage = .English
            
        case .none:
            currentLanguage = .Russian
            setLanguage(language: .Russian)
        case .some(_):
            break
        }
    }    
}
