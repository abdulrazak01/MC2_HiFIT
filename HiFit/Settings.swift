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
    @IBOutlet weak var sundayButton: UIButton!
    @IBOutlet weak var mondayButton: UIButton!
    @IBOutlet weak var tuesdayButton: UIButton!
    @IBOutlet weak var wednesdayButton: UIButton!
    @IBOutlet weak var thursdayButton: UIButton!
    @IBOutlet weak var fridayButton: UIButton!
    @IBOutlet weak var saturdayButton: UIButton!
    @IBOutlet var daysButtons: [UIButton]!
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let buttonRadius:CGFloat = 10
        
        for day in daysButtons {
            print(day.currentTitle!)
            day.layer.cornerRadius = buttonRadius
            day.layer.borderColor = #colorLiteral(red: 0.5176470588, green: 0.5176470588, blue: 0.5411764706, alpha: 1)
            day.layer.borderWidth = 1
            day.layer.backgroundColor = nil
            day.setTitleColor(#colorLiteral(red: 0.5176470588, green: 0.5176470588, blue: 0.5411764706, alpha: 1), for: .normal)
            
            // TODO: Need to figure out how to make button into toggle and on state
            
            /*
            day.setTitleColor(.red, for: .selected)
            day.setTitleColor(.blue, for: .highlighted)
            
            if day.isSelected {
                day.layer.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.6941176471, blue: 0.3215686275, alpha: 1)
                day.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            }
 */
        }
        
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
