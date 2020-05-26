//
//  Intermediate.swift
//  HiFit
//
//  Created by Omar Tan Johan Tan on 26/05/20.
//  Copyright © 2020 AbdulRazak. All rights reserved.
//

import Foundation
import UIKit

class Intermediate : UIViewController {
    
    @IBOutlet weak var TitleBegin: UILabel!
    @IBOutlet weak var Times: UILabel!
        
    var titleLabel: String = ""
    var exerciseTime: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TitleBegin?.text = titleLabel
        Times?.text = exerciseTime
        
    }
    
}
