//
//  ViewController.swift
//  Seven Game
//
//  Created by SHREDDING on 22.06.2022.
//

import UIKit

class ViewController: UIViewController,Language{
    //MARK: - my constants
    let userDefaults = UserDefaults.standard
    
    //language
    let languageSettings = LanguageSettings()
    
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
    }
    func changeEnglishLanguage(){
        rulesButtonOutlet.setTitle("Rules", for: .normal)
    }
    
    
    //MARK: - play button settings
    
    func playButtonSettings(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.startGameWindowTransition))
        self.buttonPlay.addGestureRecognizer(gesture)
    }
    @objc func startGameWindowTransition(){
        print("nextwindow")
    }
}

