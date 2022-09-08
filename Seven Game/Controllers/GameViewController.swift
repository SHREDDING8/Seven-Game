//
//  GameViewController.swift
//  Seven Game
//
//  Created by SHREDDING on 27.06.2022.
//

import UIKit

class GameViewController: UIViewController {
    var languageSettings = LanguageSettings()
    
    var game:Game!
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var theEndGame: UIButton!
    
    @IBOutlet weak var rulesLabel: UILabel!
    
    @IBOutlet weak var cardImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        let gestrue = UITapGestureRecognizer(target: self, action: #selector(round))
        cardImage.addGestureRecognizer(gestrue)
        
//        cardImage.backgroundColor = .red
        cardImage.clipsToBounds = false
        cardImage.layer.shadowColor = UIColor.black.cgColor
        cardImage.layer.shadowOpacity = 0.5
        cardImage.layer.shadowOffset = CGSize.zero
        cardImage.layer.shadowRadius = 10
        cardImage.layer.shadowPath = UIBezierPath(roundedRect: cardImage.bounds, cornerRadius: 10).cgPath
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkLanguage()
        game = Game(mode: Game.mode,language: currentLanguage)
        startSettings()
    }
    
    @objc func round(){
        if game.isEnded{
            UIView.transition(with: self.cardImage, duration: 0.5, options: .transitionCrossDissolve) {
                if currentLanguage == .Russian{
                        self.theEndGame.setTitle("Начать заново", for: .normal)
                    }else{
                        self.theEndGame.setTitle("Restart game", for: .normal)
                    }
            }
        }
        let round = game.round()
        UIView.transition(with: self.cardImage, duration: 0.5, options: .transitionCrossDissolve) {
            self.cardImage.image = round.2
        }
        UIView.transition(with: self.nameLabel, duration: 0.5, options: .transitionCrossDissolve) {
            self.nameLabel.text = round.0
        }
        UIView.transition(with: self.rulesLabel, duration: 0.5, options: .transitionCrossDissolve) {
            self.rulesLabel.text = round.1
        }

    }
    
    
    
    
    
    @IBAction func theEndGameAction(_ sender: Any) {
        if game.isEnded{
            game.restartGame(mode: Game.mode)
            startSettings()
            
            switch currentLanguage{
            case .Russian:
                changeRussianLanguage()
            case .English:
                changeEnglishLanguage()
            }
            
        }else{
            self.dismiss(animated: true)
        }
        
    }
    
    
}

extension GameViewController{
    
    func startSettings(){
        let round = game.round()
        UIView.transition(with: self.cardImage, duration: 0.5, options: .transitionCrossDissolve) {
            self.cardImage.image = round.2
        }
        UIView.transition(with: self.nameLabel, duration: 0.5, options: .transitionCrossDissolve) {
            self.nameLabel.text = round.0
        }
        UIView.transition(with: self.rulesLabel, duration: 0.5, options: .transitionCrossDissolve) {
            self.rulesLabel.text = round.1
        }
    }
}


extension GameViewController{
    
    func checkLanguage() {
            switch currentLanguage{
            case .Russian:
                changeRussianLanguage()
            case .English:
                changeEnglishLanguage()
            }
        
    }
    
    func changeRussianLanguage() {
        theEndGame.setTitle("Закончить игру", for: .normal)
    }
    
    func changeEnglishLanguage() {
        theEndGame.setTitle("Finish the game", for: .normal)
    }
    
}
