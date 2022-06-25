//
//  LanguageSettings.swift
//  Seven Game
//
//  Created by SHREDDING on 23.06.2022.
//

import Foundation
import UIKit


protocol Language{
    var languageSettings:LanguageSettings{get}
    
    func checkLanguage()
    func changeRussianLanguage()
    func changeEnglishLanguage()
}



class LanguageSettings{
    private let userDefaults =  UserDefaults.standard
    public var currentLanguage:Language = .Russian
    private let userDefaultsKey = "Language"
    
    public enum Language{
        case Russian
        case English
    }
    
    
    public func changeLanguage(){
        if (userDefaults.object(forKey: userDefaultsKey) != nil){
            
            if (languageAsLanguage(language: userDefaults.string(forKey: userDefaultsKey)!) == .Russian){
                userDefaults.set(languageAsString(language: Language.English), forKey: userDefaultsKey)
                
            }else if(languageAsLanguage(language:userDefaults.string(forKey: userDefaultsKey)!) == .English){
                userDefaults.set(languageAsString(language: Language.Russian) , forKey: userDefaultsKey)
            }
        }
    }

    
    public func setLanguage(){
        if (userDefaults.object(forKey: userDefaultsKey) == nil){
            userDefaults.set(languageAsString(language: Language.Russian), forKey: userDefaultsKey)
        }
    }

    public func checkLanguage()->Bool{
        if (self.languageAsLanguage(language: userDefaults.string(forKey: userDefaultsKey)!) != currentLanguage){
            currentLanguage = self.languageAsLanguage(language: userDefaults.string(forKey: userDefaultsKey)!)
            return false
        }else{
            return true
        }
    }
    
    private func languageAsString(language:Language)->String{
        var resultString = ""
        
        switch language{
        case .Russian:
            resultString = "Russian"
        case .English:
            resultString = "English"
        }
        return resultString
    }
    private func languageAsLanguage(language:String)->Language{
        var result:Language = .Russian
        
        if (language == "Russian"){result = .Russian}
        if (language == "English"){result = .English}
        
        return result
    }
    
    
    
}
