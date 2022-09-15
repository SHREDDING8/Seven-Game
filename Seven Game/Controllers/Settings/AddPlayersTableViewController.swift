//
//  AddPlayersTableViewController.swift
//  Seven Game
//
//  Created by SHREDDING on 09.09.2022.
//

import UIKit

class AddPlayersTableViewController:
    UITableViewController {
    
    var doAfterAdd:(() ->Void)?
    
    
    // Outlets
    @IBOutlet weak var editButtonOutlet: UIBarButtonItem!
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAddPlayersTableView()
         
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        doAfterAdd?()
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Game.players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)

        let Namelabel = cell.viewWithTag(1) as? UILabel
        Namelabel?.text? = Game.players[indexPath.row]

        return cell
    }
    

    

    // MARK: - Move
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let cellMove = Game.players[fromIndexPath.row]
        
        Game.players.remove(at: fromIndexPath.row)
        Game.players.insert(cellMove, at: to.row)
    }
    
    

    // MARK: - Edit
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            Game.players.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            if Game.players.count == 0{
                changeTextOfEditButton(editButtonOutlet)
                editButtonOutlet.isEnabled = false
            }
            
        }
    }
    
    
    // MARK: - My Funcs
    
    private func configureAddPlayersTableView(){
        tableView.backgroundView = UIImageView(image: backroundImage)
        navBar.title = "playersLabel".localize(tableName: settingsLocalizeKeyTable)
        
        
        
        if Game.players.count > 0{
            editButtonOutlet.isEnabled = true
        }
    }
    
    func createAlert(){
        var title:String
        var message:String
        
        var titleActionAdd:String
        
        var titleActioncancel:String
        
        switch currentLanguage{
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
        if Game.players.count == 1{
            editButtonOutlet.isEnabled = true
        }
        tableView.reloadData()
    }
    
    
    // actions
    @IBAction func addPlayerButton(_ sender: UIBarButtonItem) {
        createAlert()
    }
    
    
    @IBAction func editActionButton(_ sender: UIBarButtonItem) {
        changeTextOfEditButton(sender)
        
    }
    
    private func changeTextOfEditButton(_ button:UIBarButtonItem){
        if button.title == "Edit"{
            if Game.players.count != 0{
            editButtonOutlet.title = "Done"
            tableView.isEditing = true
            }
        }else{
            editButtonOutlet.title = "Edit"
            tableView.isEditing = false
        }
    }
}
