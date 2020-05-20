//
//  LevelScreen.swift
//  HiFit
//
//  Created by Muhammad Syabran on 15/05/20.
//  Copyright © 2020 AbdulRazak. All rights reserved.
//

import Foundation
import UIKit

class LevelScreen : UIViewController {
    
    
    @IBOutlet weak var levelBeginner: UIButton!
    @IBOutlet weak var levelIntermediate: UIButton!
    @IBOutlet weak var levelAdvanced: UIButton!
    @IBOutlet weak var BeginLabel: UILabel!
    
    var beginTitle: String = ""
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        level()
        
        let buttonSelectorRadius:CGFloat = 20
        
        levelBeginner.layer.cornerRadius = buttonSelectorRadius
        levelIntermediate.layer.cornerRadius = buttonSelectorRadius
        levelAdvanced.layer.cornerRadius = buttonSelectorRadius
        
        // Button Normal State
        levelBeginner.setBackgroundImage(#imageLiteral(resourceName: "BeginnerBg"), for: .normal)
        levelIntermediate.setBackgroundImage(#imageLiteral(resourceName: "IntermediateBg"), for: .normal)
        levelAdvanced.setBackgroundImage(#imageLiteral(resourceName: "AdvancedBg"), for: .normal)
        
        levelBeginner.clipsToBounds = true
        levelIntermediate.clipsToBounds = true
        levelAdvanced.clipsToBounds = true
        
        BeginLabel?.text = "\(beginTitle)"
    }
    func level() {
        let Level = defaults.value(forKey: self.beginTitle) as? String ?? ""
        BeginLabel.text = Level
    }
}
