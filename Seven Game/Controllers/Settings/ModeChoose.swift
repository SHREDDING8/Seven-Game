//
//  ModeChoose.swift
//  Seven Game
//
//  Created by SHREDDING on 08.09.2022.
//

import UIKit

class ModeChoose: UITableViewController {
    
    var doAfterSelect: (() -> Void)?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureModeTableView()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ModeCell", for: indexPath) as! ModeChooseCell
        
        
        cell.ModeLabel.text? = modesArray[currentLanguage]![indexPath.row]["title"]!
        cell.DescriptionLabel.text? = modesArray[currentLanguage]![indexPath.row]["description"]!
        
        if currentGameMode == Mode.init(rawValue: indexPath.row){
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    
    // MARK: - My funcs
    
    private func configureModeTableView(){
        tableView.backgroundView = UIImageView(image: backroundImage)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            return
        }
        
        currentGameMode = Mode.init(rawValue: indexPath.row)!
        doAfterSelect?()
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
