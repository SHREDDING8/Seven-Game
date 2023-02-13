//
//  ViewController.swift
//  Seven Game
//
//  Created by SHREDDING on 22.06.2022.
//

import UIKit

class ViewController: UIViewController{
    
    //MARK: -  Outlets
    
    @IBOutlet weak var rulesButtonOutlet: UIButton!
    
    @IBOutlet weak var number7Rotated: UILabel!
    
    @IBOutlet weak var playButtonOutlet: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        number7Rotated.layer.setAffineTransform(.init(rotationAngle: .pi))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    /**
     this function checks number of players and present alert if number is 0
     
     */
    @IBAction func startGameWindowTransition(){
        let alertTitle = "smallNumberOfPlayersTitle".localize(tableName: "Game")
        
        let alertmsg = "smallNumberOfPlayersMsg".localize(tableName: "Game")
        
        if Game.players.count == 0{
            let alert = UIAlertController(title: alertTitle, message:alertmsg , preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .default) { _ in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let gameWindow = storyboard.instantiateViewController(withIdentifier: "AddPlayersViewController")
                self.navigationController?.pushViewController(gameWindow, animated: true)
            }
            alert.addAction(action)
            self.present(alert, animated: true)
        }else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let gameWindow = storyboard.instantiateViewController(withIdentifier: "GameViewController")
            self.present(gameWindow, animated: true)
        }
    }
        
}


