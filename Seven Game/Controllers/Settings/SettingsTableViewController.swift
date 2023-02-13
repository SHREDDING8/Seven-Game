//
//  SettingsTableViewController.swift
//  Seven Game
//
//  Created by SHREDDING on 08.09.2022.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    //language
    
    
    // MARK: - outlets
    
    @IBOutlet weak var playersLabel: UILabel!
    
    @IBOutlet weak var numberOfPlayersLabel: UILabel!
    @IBOutlet weak var gameModeLabel: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var languageNameOfCellLabel: UILabel!
    
    @IBOutlet weak var gameModeNameOfCellLabel: UILabel!
    
    @IBOutlet weak var titleNavBar: UINavigationItem!
    
    
    @IBOutlet weak var testsettings: UITableViewCell!
    
    
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureTableView()
    }

    



    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toSelectMode"{
            let destination = segue.destination as! ModeChoose
            destination.doAfterSelect = { [self] in
                configureTableView()
            }
        }else if segue.identifier == "addPlayersSegue"{
            let destination = segue.destination as! AddPlayersTableViewController
            destination.doAfterAdd = { [self] in
                configureTableView()
            }
        }
        
    }
    
    
    // MARK: - myFuncs
    
    private func configureTableView(){
        // background Table View
        tableView.backgroundView = UIImageView(image: backroundImage)
        tableView.backgroundView?.contentMode = .scaleAspectFill
        
        // Nav Bar

        titleNavBar.title = "titleNavBarnameSettings".localize(tableName: settingsLocalizeKeyTable)
        
        
        // bracket
        let bracket = " \u{203A}"
        
        // Language Cell
        languageNameOfCellLabel.text? = "labelLanguageSettings".localize(tableName: settingsLocalizeKeyTable)
        languageLabel.text? = Locale.current.identifier + bracket
        
        // Mode Cell
        gameModeNameOfCellLabel.text? = "labelModeSettings".localize(tableName: settingsLocalizeKeyTable)
        gameModeLabel.text? = modeKeys[currentGameMode]!["title"]!.localize(tableName: settingsLocalizeKeyTable) + bracket
            
        
        
        // PLayers Cell
        playersLabel.text? = "playersLabel".localize(tableName: settingsLocalizeKeyTable)
        numberOfPlayersLabel.text? = String(Game.players.count) + bracket
        
    }
    
}


// MARK: - delegate and datacourse
extension SettingsTableViewController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if testsettings.isEqual(tableView.cellForRow(at:indexPath)){
            if #available(iOS 15.4, *) {
                UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
            } else {
                // Fallback on earlier versions
            }
            
        }
    }
}
