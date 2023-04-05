//
//  AddPlayersViewController.swift
//  Seven Game
//
//  Created by SHREDDING on 22.12.2022.
//

import UIKit

class AddPlayersViewController: UIViewController {
    
    
    // MARK: - Outlets
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var number7Rotated: UILabel!
    
    var doAfterAdd:(() ->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureController()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        doAfterAdd?()
    }
    
    

    // MARK: - Configure funcs
    fileprivate func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    fileprivate func configureController(){
        
        number7Rotated.layer.setAffineTransform(.init(rotationAngle: .pi))
        
        
    
        navBar.title = "playersLabel".localize(tableName: settingsLocalizeKeyTable)
        editButton.title = "editButtonTitleAddingPlayers".localize(tableName: settingsLocalizeKeyTable)
        editButton.isEnabled = Game.players.count > 0 ? true:false
            }
    
    
    // MARK: - logic of players
    
    func createAlert(){
        var title:String
        var message:String
        
        var titleActionAdd:String
        
        var titleActioncancel:String
        
        title = "titleAlertAddingPlayers".localize(tableName: settingsLocalizeKeyTable)
        message = "messageAlertAddingPlayers".localize(tableName: settingsLocalizeKeyTable)
        titleActionAdd = "titleActionAddAlertAddingPlayers".localize(tableName: settingsLocalizeKeyTable)
        titleActioncancel = "titleActioncancelAlertAddingPlayers".localize(tableName: settingsLocalizeKeyTable)
    
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
        editButton.isEnabled = Game.players.count > 0 ? true:false
        tableView.reloadData()
    }
    
    
    private func changeTextOfEditButton(_ button:UIBarButtonItem){
        let editText = "editButtonTitleAddingPlayers".localize(tableName: settingsLocalizeKeyTable)
        let doneText = "doneButtonTitleAddingPlayers".localize(tableName: settingsLocalizeKeyTable)
        if button.title == editText{
            if Game.players.count != 0{
            editButton.title = doneText
            tableView.setEditing(true, animated: true)
            }
        }else{
            editButton.title = editText
            tableView.setEditing(false, animated: true)
        }
    }
    
    
    // MARK: - Actions
    @IBAction func addPlayerButton(_ sender: UIBarButtonItem) {
        createAlert()
    }
    
    @IBAction func editActionButton(_ sender: UIBarButtonItem) {
        changeTextOfEditButton(sender)
        
    }
    
}

 // MARK: - UITableViewDelegate, UITableViewDataSource
extension AddPlayersViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Game.players.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)

        let Namelabel = cell.viewWithTag(1) as? UILabel
        Namelabel?.text? = Game.players[indexPath.row]

        return cell
    }
    
    
    // MARK: - canMoveRowAt, moveRowAt
        func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let cellMove = Game.players[fromIndexPath.row]
        
        Game.players.remove(at: fromIndexPath.row)
        Game.players.insert(cellMove, at: to.row)
    }
    
    
    // MARK: - editingStyle
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            Game.players.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            if Game.players.count == 0{
                changeTextOfEditButton(editButton)
                editButton.isEnabled = false
            }
            
        }
    }
    
    
}
