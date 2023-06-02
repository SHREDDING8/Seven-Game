//
//  GameViewController.swift
//  Seven Game
//
//  Created by SHREDDING on 27.06.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    var game:Game!
    
    var isFrontside = true
    var nextCardImage:UIImage?
    var nextCardRule:String?
    var nextPlayer:String?
    
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var theEndGame: UIButton!
    
    @IBOutlet weak var rulesLabel: UILabel!
    
    @IBOutlet weak var rulesView: UIView!
    
    @IBOutlet weak var cardImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameView: UIView!
    
    
    var numberOfCards:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = UIFont(name: "Marker Felt", size: 30)
        label.textColor = UIColor(named: "textColor2")
        label.backgroundColor = UIColor(named: "BackColor")
        label.textAlignment = .center
        label.clipsToBounds = false
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
        
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view

        cardImage.layer.masksToBounds = true
        cardImage.layer.cornerRadius = CGFloat(20)
        
        
        nameView.clipsToBounds = true
        nameView.layer.cornerRadius = 13
        self.view.insertSubview(nameView, at: 5)
        
        rulesView.clipsToBounds = true
        rulesView.layer.cornerRadius = 20
        
        self.cardImage.addSubview(numberOfCards)
        NSLayoutConstraint.activate([
            numberOfCards.leadingAnchor.constraint(equalTo: self.cardImage.trailingAnchor, constant: -120),
            numberOfCards.trailingAnchor.constraint(equalTo: self.cardImage.trailingAnchor, constant: -30),
            numberOfCards.topAnchor.constraint(equalTo: self.cardImage.topAnchor, constant: 20)
            ]
        )
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        game = Game(mode: currentGameMode)
        startSettings()
    }
    
    @objc func round(){
        
        if game.isEnded || game.currentCard > game.gameCards.count{
            let round = game.round()
            self.nextCardImage = round.2
            UIView.transition(with: self.cardImage, duration: 0.5, options: .transitionCrossDissolve) {
                self.theEndGame.titleLabel?.text = "again".localize(tableName: "Game")
            }
            UIView.transition(with: self.cardImage, duration: 0.5, options: .transitionFlipFromLeft) {
                self.cardImage.image = self.nextCardImage
            }
            
            UIView.transition(with: self.nameLabel, duration: 0.5, options: .transitionCrossDissolve) {
                self.rulesLabel.text = "endTheGame".localize(tableName: "Game")
            }
            
            self.numberOfCards.text = ""
            
            self.cardImage.gestureRecognizers?.remove(at: 0)
            
            return
        }
        
        if isFrontside{
            let round = game.round()
            self.nextCardImage = round.2
            self.nextCardRule = round.1
            self.nextPlayer = round.0
            
            
            UIView.transition(with: self.cardImage, duration: 0.5, options: .transitionFlipFromLeft) {
                self.cardImage.image = UIImage(named: "рубашка")
                self.numberOfCards.text = "\(self.game.currentCard)/\(self.game.gameCards.count)"
            }
            
            UIView.transition(with: self.nameLabel, duration: 0.5, options: .transitionCrossDissolve) {
                self.nameLabel.text = self.nextPlayer
            }
            
            UIView.transition(with: self.rulesLabel, duration: 0.5, options: .transitionCrossDissolve) {
                self.rulesLabel.text = "FlipCard".localize(tableName: "Game")
            }
            
        }else{
            UIView.transition(with: self.cardImage, duration: 0.5, options: .transitionFlipFromLeft) {
                self.cardImage.image = self.nextCardImage
            }
            UIView.transition(with: self.rulesLabel, duration: 0.5, options: .transitionCrossDissolve) {
                self.rulesLabel.text = self.nextCardRule
            }
            self.numberOfCards.text = ""
            if game.currentCard == game.gameCards.count{
                game.currentCard+=1
            }
        }
        
        
        self.isFrontside = !isFrontside
        
    }
    
    
    
    
    
    @IBAction func theEndGameAction(_ sender: Any) {
        if game.isEnded{
            game.restartGame(mode: Game.mode)
            startSettings()
            
        }else{
            let alert = UIAlertController(title: "Вы действительно хотите закончить игру?", message: nil, preferredStyle: .actionSheet)
            
            let exit = UIAlertAction(title: "Закончить игру", style: .destructive) { _ in
                self.dismiss(animated: true)
            }
            
            let cancel = UIAlertAction(title: "Отменить", style: .cancel)
            
            alert.addAction(exit)
            alert.addAction(cancel)
            
            
            self.present(alert, animated: true)
            
        }
        
    }
    
    
}

extension GameViewController{
    
    func startSettings(){
        
        let gestrue = UITapGestureRecognizer(target: self, action: #selector(round))
        self.cardImage.addGestureRecognizer(gestrue)
        
        self.theEndGame.titleLabel?.text = "finish".localize(tableName: "Game")
        isFrontside = true
        if isFrontside{
            let round = game.round()
            self.nextCardImage = round.2
            self.nextCardRule = round.1
            self.nextPlayer = round.0
            
            
            UIView.transition(with: self.cardImage, duration: 0.5, options: .transitionFlipFromLeft) {
                self.cardImage.image = UIImage(named: "рубашка")
            }
            
            UIView.transition(with: self.nameLabel, duration: 0.5, options: .transitionCrossDissolve) {
                self.nameLabel.text = self.nextPlayer
            }
            
            UIView.transition(with: self.rulesLabel, duration: 0.5, options: .transitionCrossDissolve) {
                self.rulesLabel.text = "FlipCard".localize(tableName: "Game")
            }
            
            self.numberOfCards.text = "\(self.game.currentCard)/\(self.game.gameCards.count)"
            
        }else{
            UIView.transition(with: self.cardImage, duration: 0.5, options: .transitionFlipFromLeft) {
                self.cardImage.image = self.nextCardImage
            }
            UIView.transition(with: self.rulesLabel, duration: 0.5, options: .transitionCrossDissolve) {
                self.rulesLabel.text = self.nextCardRule
            }
        }
        
        self.isFrontside = !isFrontside
        
        
    
    }
}
