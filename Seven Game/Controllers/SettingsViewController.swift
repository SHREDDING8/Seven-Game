//
//  SettingsViewController.swift
//  Seven Game
//
//  Created by SHREDDING on 23.06.2022.
//

import UIKit

class SettingsViewController: UIViewController{
    
    
    
    //MARK: - Outlets
    @IBOutlet weak var languageChangeButtonOutlet: UIButton!
    
    
    //MARK: - my constants
    //language
    let languageSettings = LanguageSettings()
    
    func checkLanguage() {
            switch currentLanguage{
            case .Russian:
                changeRussianLanguage()
            case .English:
                changeEnglishLanguage()
            }
    }
    
    func changeRussianLanguage() {
        languageChangeButtonOutlet.setTitle("🇷🇺 RU", for: .normal)
    }
    
    func changeEnglishLanguage() {
        languageChangeButtonOutlet.setTitle("🇬🇧 EN", for: .normal)
    }
    

    @IBOutlet weak var backgroundUIView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsBackgound()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkLanguage()
    }
    
    //MARK: - My funcs
    func settingsBackgound(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.closeSceneAfterTapOnView))
        
        self.backgroundUIView.addGestureRecognizer(gesture)
    }
    
    //MARK: - @objc funcs
    @objc func closeSceneAfterTapOnView(){
        self.dismiss(animated: true)
    }
    
    
    //MARK: - Actions
    
    @IBAction func testLanguageButton(_ sender: Any) {
        switch currentLanguage{
        case .Russian:
            languageChangeButtonOutlet.setTitle("🇷🇺 RU", for: .normal)
        case .English:
            languageChangeButtonOutlet.setTitle("🇬🇧 EN", for: .normal)
            
        }
        
        exit(0)
        
        
        
    }
    
    @IBAction func TestCloseButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
