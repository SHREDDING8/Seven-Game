//
//  RulesViewController.swift
//  Seven Game
//
//  Created by SHREDDING on 24.06.2022.
//

import UIKit

class RulesViewController: UIViewController {

    //MARK: - Outlets
    
    //sections
    @IBOutlet weak var closeButtonOutlet: UIButton!
    
    @IBOutlet weak var extendedVersionLabelOutlet: UILabel!
    
    @IBOutlet weak var rulesLabelOutlet: UILabel!
    
    
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
    var languageSettings = LanguageSettings()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set text and corner radius
        self.rulesSet(.Russian)
//        self.languageSettings.currentLanguage = .Russian

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkLanguage()
        
    }
    
    
    
    //MARK: - language
    
    func checkLanguage(){
            switch currentLanguage{
            case .Russian:
                changeRussianLanguage()
            case .English:
                changeEnglishLanguage()
            }
        
    }
    
    func changeRussianLanguage(){
        rulesLabelOutlet.text = "Правила"
        closeButtonOutlet.setTitle("Спасибо", for: .normal)
        extendedVersionLabelOutlet.text = "Расширенная версия"
        self.rulesSet(.Russian)
    }
    func changeEnglishLanguage(){
        rulesLabelOutlet.text = "Rules"
        closeButtonOutlet.setTitle("Thanks", for: .normal)
        extendedVersionLabelOutlet.text = "Extended Version"
        self.rulesSet(.English)
    }
    
    
    //MARK: - My funcs
    
    func rulesSet(_ language:Language){
        let RulesLabels = [
            RuleLabel2,
            RuleLabel3,
            RuleLabel4,
            RuleLabel5,
            RuleLabel6,
            RuleLabel7,
            RuleLabel8,
            RuleLabel9,
            RuleLabel10,
            RuleLabel11,
            RuleLabel12,
            RuleLabel13,
            RuleLabel14
        ]
        
        var indexRule = 2
        let masksToBounds = true
        let cornerRadius = 15.0
        
        for rule in RulesLabels{
            switch language{
            case .Russian:
                rule!.text = Rules.rulesRussian[String(indexRule)]
            case .English:
                rule!.text = Rules.rulesEnglish[String(indexRule)]
            }
            
            rule?.layer.masksToBounds = masksToBounds
            rule?.layer.cornerRadius = cornerRadius
            rule?.shadowColor = .systemYellow
            rule?.shadowOffset.width = 1.0
            rule?.shadowOffset.height = 1.0
            
            rule?.textColor = .brown
            
            indexRule+=1
        }
        
        switch language{
        case .Russian:
            RuleLabel15_1.text = Rules.rulesRussian["15_1"]
            RuleLabel15_2.text = Rules.rulesRussian["15_2"]
            
        case .English:
            RuleLabel15_1.text = Rules.rulesEnglish["15_1"]
            RuleLabel15_2.text = Rules.rulesEnglish["15_2"]
        }
            
        // set text
        
        
        // set corner radius
        RuleLabel15_1.layer.masksToBounds = masksToBounds
        RuleLabel15_2.layer.masksToBounds = masksToBounds
        
        RuleLabel15_1.layer.cornerRadius = cornerRadius
        RuleLabel15_2.layer.cornerRadius = cornerRadius
        
        RuleLabel15_1.shadowColor = UIColor.systemYellow
        RuleLabel15_2.shadowColor = UIColor.systemYellow
        
        RuleLabel15_1.shadowOffset.width = 2.0
        RuleLabel15_2.shadowOffset.height = 2.0
    }
    

    
    //MARK: - Actions
    @IBAction func closeSceneButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
