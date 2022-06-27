//
//  AddPlayersViewController.swift
//  Seven Game
//
//  Created by SHREDDING on 26.06.2022.
//

import UIKit


struct playerStruct{
var name:String
}

class AddPlayersViewController: UIViewController {
    
    //MARK: - my const
    //language
    var languageSettings = LanguageSettings()
    

    
    //MARK: - Outlets
    @IBOutlet weak var navItemOutlet: UINavigationItem!
    
    
    @IBOutlet weak var playersTableViewOutlet: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkLanguage()
    }
    
    
    
    
    //MARK: - Actions
    
    @IBAction func addPlayerButton(_ sender: UIBarButtonItem) {
        createAlert()
    }
    
    
}


extension AddPlayersViewController:LanguageProtocol{
    
    
    func checkLanguage() {
        if languageSettings.checkLanguage() == false{
            switch languageSettings.currentLanguage{
            case .Russian:
                changeRussianLanguage()
            case .English:
                changeEnglishLanguage()
            }
        }
    }
    
    func changeRussianLanguage() {
        navItemOutlet.title = "Список игроков"
    }
    
    func changeEnglishLanguage() {
        navItemOutlet.title = "Players list"
    }
    
    
}

extension AddPlayersViewController{
    //MARK: - my Funcs
    
    func createAlert(){
        var title:String
        var message:String
        
        var titleActionAdd:String
        
        var titleActioncancel:String
        
        switch languageSettings.currentLanguage{
        case .Russian:
            title = "Новый Игрок"
            message = "Введи имя"
            titleActionAdd = "Добавить"
            titleActioncancel = "Отмена"
        
        case .English:
            title = "New player"
            message = "Enter name"
            titleActionAdd = "Add"
            titleActioncancel = "Cancel"
        }
    
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField()
        let addAction = UIAlertAction(title: titleActionAdd, style: .default) { _ in
            if alert.textFields?[0].text != ""{
                self.addToPlayers(player: (alert.textFields?[0].text)!)
            }
            
        }
        let cancelAction = UIAlertAction(title: titleActioncancel, style: .cancel)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
    
    func addToPlayers(player:String){
        Game.players.append(player)
        playersTableViewOutlet.reloadData()
    }
}

extension AddPlayersViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell
        if let reusecell = tableView.dequeueReusableCell(withIdentifier: "player"){
            cell = reusecell
        }else{
            cell = UITableViewCell(style: .default, reuseIdentifier: "player")
        }
        var config = cell.defaultContentConfiguration()
        config.text = Game.players[indexPath.row]
        cell.contentConfiguration = config
        return cell
        
    }
    
}



extension AddPlayersViewController:UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        var title:String
        
        switch languageSettings.currentLanguage{
        case .Russian:
            title = "Удалить"
        
        case .English:
            title = "Delete"
        }
        
        
        let deleteAction = UIContextualAction(style: .destructive, title: title) { _, _, _ in
            Game.players.remove(at: indexPath.row)
            tableView.reloadData()
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemBlue
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

}



