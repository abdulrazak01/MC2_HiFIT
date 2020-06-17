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
    
    private let buttonRadius:CGFloat = 10
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        for day in daysButtons {
            day.layer.cornerRadius = buttonRadius
            day.layer.borderColor = #colorLiteral(red: 0.5176470588, green: 0.5176470588, blue: 0.5411764706, alpha: 1)
            day.layer.borderWidth = 1
            day.layer.backgroundColor = nil
            day.setTitleColor(#colorLiteral(red: 0.5176470588, green: 0.5176470588, blue: 0.5411764706, alpha: 1), for: .normal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Show navigation bar background
        self.navigationController?.navigationBar.setBackgroundImage(nil, for:.default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    @IBAction func daysButtonsTouched(_ sender: UIButton) {
        sender.setTitleColor(.systemBackground, for: .selected)
        
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            sender.layer.borderWidth = 0
            sender.tintColor = UIColor.clear // remove blue button background
            sender.applyGradient(colors: [ #colorLiteral(red: 0.537254902, green: 0.7882352941, blue: 0.1921568627, alpha: 1) , #colorLiteral(red: 0.3294117647, green: 0.6117647059, blue: 0.07058823529, alpha: 1) ], radius: buttonRadius)
        } else {
            sender.layer.borderWidth = 1
            // only remove sublayer with the name "gradient"
            if let firstIndex = sender.layer.sublayers?.firstIndex(where: {$0.name == "gradient"}) {
                sender.layer.sublayers?.remove(at: firstIndex)
            }
        }
    }
}
