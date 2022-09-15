//
//  StringExtensionLanguage.swift
//  Seven Game
//
//  Created by SHREDDING on 14.09.2022.
//

import Foundation


extension String{
    func localize(tableName:String = "Localizable") -> String{
        return NSLocalizedString(self, tableName: tableName, bundle: .main, value: "нет перевода", comment: "")
    }
}
