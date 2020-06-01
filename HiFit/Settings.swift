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
            sender.applyGradient(colors: [ #colorLiteral(red: 0.5098039216, green: 0.8431372549, blue: 0.5254901961, alpha: 1) , #colorLiteral(red: 0.3058823529, green: 0.6941176471, blue: 0.3215686275, alpha: 1) ], radius: buttonRadius)
        } else {
            sender.layer.borderWidth = 1
            // only remove sublayer with the name "gradient"
            if let firstIndex = sender.layer.sublayers?.firstIndex(where: {$0.name == "gradient"}) {
                sender.layer.sublayers?.remove(at: firstIndex)
            }
        }
    }
}

extension UIButton
{
    /**
    # Apply Gradient
     UIButton Extension to make applying gradient a breeze
     
     Check out [AppCoda](https://www.appcoda.com/cagradientlayer/) for gradient direction info
     
     - Parameters:
       - colors: Minimum 2 colors
       - radius: Optional
       - startGradient: Optional, range: 0.0 - 1.0
       - endGradient: Optional, range: 0.0 - 1.0
    */
    func applyGradient(colors: [CGColor], radius:CGFloat = 0, startGradient:CGPoint = CGPoint(x: 0.5, y: 0.0), endGradient:CGPoint = CGPoint(x: 0.5, y: 1.0))
    {
        // check first if there is already a gradient layer to avoid adding more than one
        if let firstIndex = layer.sublayers?.firstIndex(where: {$0.name == "gradient"}),
            let gradientLayer = layer.sublayers?[firstIndex] as? CAGradientLayer {
            gradientLayer.cornerRadius = radius
            gradientLayer.colors = colors
            gradientLayer.startPoint = startGradient
            gradientLayer.endPoint = endGradient
            gradientLayer.frame = bounds
        // if not found create a new gradient layer
        } else {
            let gradientLayer = CAGradientLayer()
            gradientLayer.name = "gradient"
            gradientLayer.cornerRadius = radius
            gradientLayer.colors = colors
            gradientLayer.startPoint = startGradient
            gradientLayer.endPoint = endGradient
            gradientLayer.frame = bounds
            layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}

extension UIView
{
    /**
    # Apply Gradient
     UIButton Extension to make applying gradient a breeze
     
     Check out [AppCoda](https://www.appcoda.com/cagradientlayer/) for gradient direction info
     
     - Parameters:
       - colors: Minimum 2 colors
       - radius: Optional
       - startGradient: Optional, range: 0.0 - 1.0
       - endGradient: Optional, range: 0.0 - 1.0
    */
    func applyGradients(colors: [CGColor], radius:CGFloat = 0, startGradient:CGPoint = CGPoint(x: 0.5, y: 0.0), endGradient:CGPoint = CGPoint(x: 0.5, y: 1.0))
    {
    
            let gradientLayer = CAGradientLayer()
            gradientLayer.cornerRadius = radius
            gradientLayer.colors = colors
            gradientLayer.startPoint = startGradient
            gradientLayer.endPoint = endGradient
            gradientLayer.frame = bounds
            layer.insertSublayer(gradientLayer, at: 0)
        
    }
}
