//
//  Game.swift
//  Seven Game
//
//  Created by SHREDDING on 26.06.2022.
//

import Foundation

enum Mode {
    case Default
    case Extended
}

protocol GameProtocol{
    static var players: [String]{get}
    static var mode:Mode{get}

}

class Game:GameProtocol{
    static var mode:Mode = .Default
    
    
    static var players: [String] = []
}
