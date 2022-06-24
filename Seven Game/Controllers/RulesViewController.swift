//
//  RulesViewController.swift
//  Seven Game
//
//  Created by SHREDDING on 24.06.2022.
//

import UIKit

class RulesViewController: UIViewController {

    @IBOutlet weak var test: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test.layer.masksToBounds = true
        
        test.layer.cornerRadius = 17

        // Do any additional setup after loading the view.
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
