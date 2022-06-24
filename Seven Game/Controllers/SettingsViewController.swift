//
//  SettingsViewController.swift
//  Seven Game
//
//  Created by SHREDDING on 23.06.2022.
//

import UIKit

class SettingsViewController: UIViewController{
    
    //MARK: - my constants
    //language
    let languageSettings = LanguageSettings()
    

    @IBOutlet weak var backgroundUIView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add tap action on view to close scene
        settingsBackgound()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let storyvoard = UIStoryboard(name: "Main", bundle: nil)
        let asd = storyvoard.instantiateViewController(withIdentifier: "MainMenuViewController")
        asd.dismiss(animated: true)
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
        languageSettings.changeLanguage()
    }
    
    @IBAction func TestCloseButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
