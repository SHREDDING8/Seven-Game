//
//  LanguageChoose.swift
//  Seven Game
//
//  Created by SHREDDING on 08.09.2022.
//

import UIKit

class LanguageChoose: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return languages.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath) as! LanguageCell
        
        cell.LanguageLabel.text? = languages[indexPath.row].rawValue
        
        if languages[indexPath.row] == currentLanguage{
            cell.accessoryType = .checkmark
        }

        return cell
    }
    
    
    // MARK: - My funcs
    
    private func configureTableView(){
        tableView.backgroundView = UIImageView(image: backroundImage)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == .checkmark{
            return
        }
        
        let toLanguage = languages[indexPath.row]
        let alertChangeLanguage = configureAlert(toLanguage: toLanguage)
        
        self.present(alertChangeLanguage, animated: true)
        
        
    }
    
    private func  configureAlert(toLanguage:Language) -> UIAlertController{
        
        let titleAlert:String
        let messageAlert:String
        
        let titleOk:String
        let titleCancel:String
        
        switch currentLanguage{
        case .Russian:
            titleAlert = "Смена языка"
            messageAlert = "Вы действительно хотите сменить язык на \(toLanguage)? При смене языка требуется перезапуск приложения"
            titleOk = "Да"
            titleCancel = "Нет"
        case .English:
            titleAlert = "Changing the language"
            messageAlert = "Do you really want to change the language \(toLanguage)? Changing the language requires restarting the application"
            titleOk = "Yes"
            titleCancel = "No"
            
        }
        
        
        
        let alertToChangeLanguage = UIAlertController(title: titleAlert, message: messageAlert, preferredStyle: .alert)
        
        let alertActionOk = UIAlertAction(title: titleOk, style: .default) { _ in
            let language = LanguageSettings()
            language.setLanguage(language: toLanguage)
            exit(0)
        }
        let alertActionCancel = UIAlertAction(title: titleCancel, style: .cancel)
        
        alertToChangeLanguage.addAction(alertActionOk)
        alertToChangeLanguage.addAction(alertActionCancel)
        
        return alertToChangeLanguage
    }
}
