//
//  SettingsTableViewController.swift
//  Seven Game
//
//  Created by SHREDDING on 08.09.2022.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    //language
    let languageSettings = LanguageSettings()
    
    
    // MARK: - outlets
    
    
    @IBOutlet weak var gameModeLabel: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var languageNameOfCellLabel: UILabel!
    
    @IBOutlet weak var gameModeNameOfCellLabel: UILabel!
    
    @IBOutlet weak var titleNavBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        setSettingstableView()
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return numberOfSectionsOfSettingsPage
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numberOfRowsInSettingsPage
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }



    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
    // MARK: - myFuncs
    
    private func setSettingstableView(){
        tableView.backgroundView = UIImageView(image: backroundImage)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        // languageSettings
        switch currentLanguage{
        case .Russian:
            russianLanguageSettings()
        case .English:
            englishLanguageSettings()
        }
        
        // adding bracket to the gamemode language and  cell
        gameModeLabel.text? += " \u{203A}"
        languageLabel.text? += " \u{203A}"
    }
    
    
    private func russianLanguageSettings(){
        titleNavBar.title = "Настройки"
        navigationController?.navigationBar.topItem?.title = "Назад"
        
        languageNameOfCellLabel.text? = "Язык"
        languageLabel.text? = currentLanguage.rawValue
        
        gameModeLabel.text? = (Game.mode == .Default ? "Обычный" : "Расширенный")
        gameModeNameOfCellLabel.text? = "Режим"
        
        
        
    }
    
    private func englishLanguageSettings(){
        titleNavBar.title = "Settings"
        
        languageNameOfCellLabel.text? = "Language"
        languageLabel.text? = currentLanguage.rawValue
        
        gameModeLabel.text? = (Game.mode == .Default ? "Default" : "Extended")
        gameModeNameOfCellLabel.text? = "Mode"
        
    }

}
