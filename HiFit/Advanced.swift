//
//  Advanced.swift
//  HiFit
//
//  Created by Omar Tan Johan Tan on 26/05/20.
//  Copyright © 2020 AbdulRazak. All rights reserved.
//

import Foundation
import UIKit

class Advanced : UIViewController {
    
    @IBOutlet weak var TitleBegin: UILabel!
    @IBOutlet weak var Times: UILabel!
    @IBOutlet weak var DescriptionTextAdvn: UILabel!
    @IBOutlet weak var ButtonStart: UIButton!
    
    var titleLabel: String = ""
    var exerciseTime: String = ""
    var descripts: String = "This is advanced level workout are create for who has a good knowledge and routinely do workout."
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TitleBegin?.text = titleLabel
        Times?.text = exerciseTime
        DescriptionTextAdvn?.text = descripts
     
        let buttonSelectorRadius:CGFloat = 20
        
        ButtonStart.layer.cornerRadius = buttonSelectorRadius
    }
    
}
