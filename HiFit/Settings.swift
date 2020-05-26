//
//  Settings.swift
//  HiFit
//
//  Created by Omar Tan Johan Tan on 26/05/20.
//  Copyright © 2020 AbdulRazak. All rights reserved.
//

import Foundation
import UIKit

class Settings : UIViewController {
    override func viewDidLoad() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
//        self.navigationController?.navigationBar.setBackgroundImage(nil, for:.default)
//        self.navigationController?.navigationBar.shadowImage = nil
//        self.navigationController?.navigationBar.layoutIfNeeded()
        print("Hello World")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Show navigation bar background
         self.navigationController?.navigationBar.setBackgroundImage(nil, for:.default)
         self.navigationController?.navigationBar.shadowImage = nil
         self.navigationController?.navigationBar.layoutIfNeeded()
    }
}
