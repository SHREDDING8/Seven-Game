//
//  ViewController.swift
//  Seven Game
//
//  Created by SHREDDING on 22.06.2022.
//

import UIKit

class ViewController: UIViewController{
    //MARK: - my constants
    let userDefaults = UserDefaults.standard
    
    //language
    
    //MARK: -  Outlets
    
    @IBOutlet weak var rulesButtonOutlet: UIButton!
    
    @IBOutlet weak var buttonPlay: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // set settings for button  play
        playButtonSettings()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    //MARK: - Language
    

    
    
    
    //MARK: - play button settings
    
    func playButtonSettings(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.startGameWindowTransition))
        self.buttonPlay.addGestureRecognizer(gesture)
    }
    @objc func startGameWindowTransition(){
        var alertTitle:String
        var actionTitle:String
        
        alertTitle = "Add at least one player"
        actionTitle = "Add"
        
        if Game.players.count == 0{
            let alert = UIAlertController(title: alertTitle, message:nil , preferredStyle: .alert)
            let action = UIAlertAction(title: actionTitle, style: .default) { _ in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let gameWindow = storyboard.instantiateViewController(withIdentifier: "AddPlayersTableViewController")
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


