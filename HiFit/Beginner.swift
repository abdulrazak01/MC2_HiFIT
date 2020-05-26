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
    
    var titleLabel: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TitleBegin?.text = titleLabel

    }
    
}
