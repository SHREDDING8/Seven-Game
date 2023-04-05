//
//  RulesViewController.swift
//  Seven Game
//
//  Created by SHREDDING on 24.06.2022.
//

import UIKit

class RulesViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var mainRulesView: UIView!
    @IBOutlet weak var mainRules: UILabel!
    
    //sections
    
    @IBOutlet weak var rulesLabelOutlet: UILabel!
    
    @IBOutlet weak var classicModeLabel: UILabel!
    
    @IBOutlet weak var extendedVersionLabelOutlet: UILabel!
    
    @IBOutlet weak var closeButtonOutlet: UIButton!
    
    
    //rules
    @IBOutlet weak var RuleLabel2: UILabel!
    
    @IBOutlet weak var RuleLabel3: UILabel!
    
    @IBOutlet weak var RuleLabel4: UILabel!
    
    @IBOutlet weak var RuleLabel5: UILabel!
    
    @IBOutlet weak var RuleLabel6: UILabel!
    
    @IBOutlet weak var RuleLabel7: UILabel!
    
    @IBOutlet weak var RuleLabel8: UILabel!
    
    @IBOutlet weak var RuleLabel9: UILabel!
    
    @IBOutlet weak var RuleLabel10: UILabel!
    
    @IBOutlet weak var RuleLabel11: UILabel!
    
    @IBOutlet weak var RuleLabel12: UILabel!
    
    @IBOutlet weak var RuleLabel13: UILabel!
    
    @IBOutlet weak var RuleLabel14: UILabel!
    
    @IBOutlet weak var RuleLabel15_1: UILabel!
    @IBOutlet weak var RuleLabel15_2: UILabel!
    
    
    
    
    //MARK: - My constants
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //set text and corner radius
        self.rulesSet()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - My funcs
    
    func rulesSet(){
        
        rulesLabelOutlet.text = "RulesLabel".localize(tableName: "Rules")
        
        closeButtonOutlet.setTitle("closeButton".localize(tableName: "Rules"), for: .normal)
        
        extendedVersionLabelOutlet.text = "expertModeTitle".localize(tableName: "Settings")
        classicModeLabel.text = "classicModeTitle".localize(tableName: "Settings")
        
        
        
        mainRules.text = "mainRules".localize(tableName: "Rules")
        mainRulesView.layer.masksToBounds = true
        mainRulesView.layer.cornerRadius = 15.0
        mainRules.shadowOffset.width = 0.0
        mainRules.shadowOffset.height = 0.0
        mainRules.textColor = UIColor(named: "textColor2")
        
        
        
        
        
        let RulesLabels = [
            RuleLabel2: "Rule2",
            RuleLabel3: "Rule3",
            RuleLabel4: "Rule4",
            RuleLabel5: "Rule5",
            RuleLabel6: "Rule6",
            RuleLabel7: "Rule7",
            RuleLabel8: "Rule8",
            RuleLabel9: "Rule9",
            RuleLabel10: "Rule10",
            RuleLabel11: "Rule11",
            RuleLabel12: "Rule12",
            RuleLabel13: "Rule13",
            RuleLabel14: "Rule14",
            RuleLabel15_1: "Rule15_1",
            RuleLabel15_2: "Rule15_2"
            
        ]
        
        var indexRule = 2
        let masksToBounds = true
        let cornerRadius = 15.0
        
        for (rule,key) in RulesLabels{
            rule!.text = key.localize(tableName: "Rules")
            
            rule?.layer.masksToBounds = masksToBounds
            rule?.layer.cornerRadius = cornerRadius
            rule?.shadowOffset.width = 0.0
            rule?.shadowOffset.height = 0.0
            
            rule?.textColor = UIColor(named: "textColor2")
            rule?.backgroundColor = UIColor(named: "BackColor")
            indexRule+=1
        }
        
    }
    
    //MARK: - Actions
    @IBAction func closeSceneButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
