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
        
        levelBeginner.layer.cornerRadius = 15
        levelIntermediate.layer.cornerRadius = 15
        levelAdvanced.layer.cornerRadius = 15
    }
}
