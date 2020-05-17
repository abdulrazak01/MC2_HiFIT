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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
}
