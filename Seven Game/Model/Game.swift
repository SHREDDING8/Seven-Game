//
//  Game.swift
//  Seven Game
//
//  Created by SHREDDING on 26.06.2022.
//

import Foundation
import UIKit

public enum Mode:Int {
    case Default = 0
    case Extended = 1
}


//let modesArray:[Language:[[String:String]]] =
//[
//    .Russian : [
//        ["title" : "Любитель","description": "Ты только начал выпивать или играешь чисто за компанию? Тогда этот режим - то, что тебе нужно. Прочувствуй весь азарт, веселье от проведённого времени вместе с друзьями и алкоголем) Колода из 36 карт, простые правила. Пей и веселись!",],
//        ["title" : "Эксперт","description": "Считаешь себя истинным ценителем алкоголя? Игра тебе уже непонаслышке знакома? тогда играй по усложнённым правилам теперь карт больше - колода из 52 карт. Больше свободы в действиях и больше возможностей выпить) Cheers!",],
//    ],
//
//
//    .English : [
//        ["title" : "Newbie","description": "Have you just started drinking or are you playing purely for the company? Then this mode is what you need. Feel all the excitement, fun from your time with friends and alcohol) Deck of 36 cards, simple rules. Drink and have fun!",],
//        ["title" : "Expert","description": "Do you consider yourself a true connoisseur of alcohol? Do you know the game firsthand? Then play by complicated rules. Now there are more cards - a deck of 52 cards. More freedom in action and more opportunities to drink) Cheers!",],
//    ],
//
//]



protocol GameProtocol{
    static var mode:Mode{get}
    
    var gameCards:[String]{get}
    
    
    var currentPlayer:Int{get set}
    var currentCard:Int{get}
    var isEnded:Bool{get}

    func getRandomCards(mode:Mode)
    
    func round() ->(String,String,UIImage)

}

class Game:GameProtocol{
    
    
    static var mode:Mode = currentGameMode

    static var players: [String] = []{
        didSet{
            maxPlayer = Game.players.max(by: { String1, String2 in
                return String1.count < String2.count
            })?.count
    }
}
                             
                             
    static var maxPlayer:Int? = 0
        
    var currentPlayer: Int = 0{
        didSet{
            if currentPlayer == Game.players.count{
                currentPlayer = 0
            }
        }
    }
    var currentCard:Int = 0
    
    var isEnded:Bool{
        if currentCard > self.gameCards.count{
            return true
        }else{
            return false
        }
    }
    
    
    public var gameCards:[String] = []
    
    
    
    
    
    
    //MARK: - funcs
    
    func restartGame(mode:Mode){
        self.gameCards = []
        self.currentCard = 0
        self.currentPlayer = 0
        getRandomCards(mode: mode)
    }
    
    
    func getRandomCards(mode:Mode){
         var defaultCards = [
        "6_1", "6_2", "6_3", "6_4",
        "7_1", "7_2", "7_3", "7_4",
        "8_1", "8_2", "8_3", "8_4",
        "9_1", "9_2", "9_3", "9_4",
        "10_1", "10_2", "10_3", "10_4",
        "11_1", "11_2", "11_3", "11_4",
        "12_1", "12_2", "12_3", "12_4",
        "13_1", "13_2", "13_3", "13_4",
        "14_1", "14_2", "14_3", "14_4",
       ]
         var extendedCards = [
            "2_1", "2_2", "2_3", "2_4",
            "3_1", "3_2", "3_3", "3_4",
            "4_1", "4_2", "4_3", "4_4",
            "5_1", "5_2", "5_3", "5_4",
            "6_1", "6_2", "6_3", "6_4",
            "7_1", "7_2", "7_3", "7_4",
            "8_1", "8_2", "8_3", "8_4",
            "9_1", "9_2", "9_3", "9_4",
            "10_1", "10_2", "10_3", "10_4",
            "11_1", "11_2", "11_3", "11_4",
            "12_1", "12_2", "12_3", "12_4",
            "13_1", "13_2", "13_3", "13_4",
            "14_1", "14_2", "14_3", "14_4",
            "15_1","15_2"
        ]
        var numberOfCards:Int
        if mode == .Default{
            numberOfCards = 36
        }else{
            numberOfCards = 54
        }
        
        while numberOfCards > 0{
            let randomElement = Int.random(in: 0...numberOfCards-1)
            if mode == .Default{
                gameCards.append(defaultCards[randomElement])
                defaultCards.remove(at: randomElement)
            }else{
                gameCards.append(extendedCards[randomElement])
                extendedCards.remove(at: randomElement)
            }
            numberOfCards-=1
        }
    }
    
    init(mode:Mode){
        getRandomCards(mode: mode)
        
    }
    
    
    func round() ->(String,String,UIImage) {
        
        if isEnded || self.currentCard == self.gameCards.count  {
            self.currentCard+=1
            var currentRule: String{
                return "endTheGame".localize(tableName: "Game")
            }
            let roundPlayer = ""
            let currentCardImage = UIImage(named: "321")
            return (roundPlayer,currentRule,currentCardImage!)
        }
    var currentRule:String
        let roundPlayer = Game.players[currentPlayer]
        if (self.gameCards[currentCard] == "15_1" || self.gameCards[currentCard] == "15_2"){
            currentRule = "Rule\(self.gameCards[currentCard])".localize(tableName: "Rules")
        }else{
            currentRule = "Rule\(self.gameCards[currentCard].prefix(self.gameCards[currentCard].count-2))".localize(tableName: "Rules")
        }
        let currentCardImage = UIImage(named: self.gameCards[currentCard])
        
        currentPlayer+=1
        currentCard+=1
        return (roundPlayer,currentRule,currentCardImage!)
    }
    
}
