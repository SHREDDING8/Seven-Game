//
//  ViewController.swift
//  Seven Game
//
//  Created by SHREDDING on 22.06.2022.
//

import UIKit

class ViewController: UIViewController,LanguageProtocol{
    //MARK: - my constants
    let userDefaults = UserDefaults.standard
    
    //language
    let languageSettings = LanguageSettings()
    
    //MARK: -  Outlets
    
    @IBOutlet weak var versionOutlet: UILabel!
    @IBOutlet weak var rulesButtonOutlet: UIButton!
    
    @IBOutlet weak var buttonPlay: UIImageView!
    
    @IBOutlet weak var addPlayersButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // set settings for button  play
        playButtonSettings()
        
        versionOutlet.layer.masksToBounds = true
        versionOutlet.layer.cornerRadius = 14
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkLanguage()
        
    }
    //MARK: - Language
    
    func checkLanguage(){
        if languageSettings.checkLanguage() == false{
            switch languageSettings.currentLanguage{
            case .Russian:
                changeRussianLanguage()
            case .English:
                changeEnglishLanguage()
            }
            
        }
        
    }
    
    
    func changeRussianLanguage(){
        rulesButtonOutlet.setTitle("Правила", for: .normal)
        versionOutlet.text = "Обычная версия"
        
        addPlayersButton.setTitle("Добавить игроков", for: .normal)
    }
    func changeEnglishLanguage(){
        rulesButtonOutlet.setTitle("Rules", for: .normal)
        versionOutlet.text = "Default version"
        
        addPlayersButton.setTitle("Add players", for: .normal)
    }
    
    
    //MARK: - play button settings
    
    func playButtonSettings(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.startGameWindowTransition))
        self.buttonPlay.addGestureRecognizer(gesture)
    }
    @objc func startGameWindowTransition(){
        var alertTitle:String
        var actionTitle:String
        
        switch languageSettings.currentLanguage{
        case .Russian:
            alertTitle = "Добавьте как минимум одного игрока"
            actionTitle = "Добавить"
        case .English:
            alertTitle = "Add at least one player"
            actionTitle = "Add"
        }
        
        if Game.players.count == 0{
            let alert = UIAlertController(title: alertTitle, message:nil , preferredStyle: .alert)
            let action = UIAlertAction(title: actionTitle, style: .default) { _ in
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
    
    
    
    
    @IBAction func versionSwitchAction(_ sender: UISwitch) {
        
        var defaultVersion:String
        var extendedVersion:String
        
        switch languageSettings.currentLanguage{
        case .Russian:
            defaultVersion = "Обычная версия"
            extendedVersion = "Расширенная версия"
        case .English:
            defaultVersion = "Default version"
            extendedVersion = "Extended version"
            
        }
        
        if sender.isOn{
            versionOutlet.text = extendedVersion
            Game.mode = .Extended
        }else{
            versionOutlet.text = defaultVersion
            Game.mode = .Default
        }
        
    }
    
}


