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
    let languageSettings = LanguageSettings()
    
    //MARK: -  Outlets
    
    @IBOutlet weak var rulesButtonOutlet: UIButton!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(viewWillAppear)
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
    
    
    @IBAction func test(_ sender: Any) {
//        self.dismiss(animated: true)
    }
    
    

}

