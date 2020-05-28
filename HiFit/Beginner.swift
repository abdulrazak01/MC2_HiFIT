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
    @IBOutlet weak var DescriptionTextBegin: UILabel!
    @IBOutlet weak var ButtonStart: UIButton!
    
    var titleLabel: String = ""
    var exerciseTime: String = ""
    var descripts: String = "This is beginner level workout are create for who never or just begin to do workout."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TitleBegin?.text = titleLabel
        Times?.text = exerciseTime
        DescriptionTextBegin?.text = descripts
        
        let buttonSelectorRadius:CGFloat = 20
        
        ButtonStart.layer.cornerRadius = buttonSelectorRadius
    }
    
}
