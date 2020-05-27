//
//  Beginner.swift
//  HiFit
//
//  Created by Muhammad Syabran on 20/05/20.
//  Copyright © 2020 AbdulRazak. All rights reserved.
//

import Foundation
import UIKit

class Beginner : UIViewController {
    
    @IBOutlet weak var TitleBegin: UILabel!
    @IBOutlet weak var Times: UILabel!
    @IBOutlet weak var ButtonStart: UIButton!
    
    var titleLabel: String = ""
    var exerciseTime: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TitleBegin?.text = titleLabel
        Times?.text = exerciseTime
        
        let buttonSelectorRadius:CGFloat = 20
        
        ButtonStart.layer.cornerRadius = buttonSelectorRadius
    }
    
}
