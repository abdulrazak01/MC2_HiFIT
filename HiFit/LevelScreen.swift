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
    
    
    @IBOutlet weak var hello: UILabel!
    @IBOutlet weak var levelBeginner: UIButton!
    @IBOutlet weak var levelIntermediate: UIButton!
    @IBOutlet weak var levelAdvanced: UIButton!
    @IBOutlet weak var BeginLabel: UILabel!
    @IBOutlet weak var IntermediateLabel: UILabel!
    @IBOutlet weak var AdvancedLabel: UILabel!
    @IBOutlet weak var ExercisesBeginnerLabel: UILabel!
    @IBOutlet weak var ExercisesIntermLabel: UILabel!
    @IBOutlet weak var ExercisesAdvnLabel: UILabel!
    
    @IBOutlet var buttonLevels: [UIButton]!
    
    var beginTitle: String = "Beginner"
    var BeginTimes: String = "16 minutes minimum"
    
    var IntermTitle: String = "Intermediate"
    var IntermTimes: String = "18 minutes minimum"
    
    var AdvnTitle: String = "Advanced"
    var AdvnTimes: String = "21 minutes minimum"
    
    let speechService = SpeechService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "Workout Levels"
        hello.dynamicFont(textStyles: .largeTitle, weight: .bold, dynamicType: true)
        
        /*
         Thanks the following resource for helping rounded edge drop shadow and Sketch to XCode shadow
         - Rounded Edge and Drop Shadow
         https://stackoverflow.com/questions/4754392/uiview-with-rounded-corners-and-drop-shadow
         - Sketch to XCode shadow
         https://stackoverflow.com/questions/34269399/how-to-control-shadow-spread-and-blur
         */
        for level in buttonLevels {
            // add shadow subview to the base view
            let shadowView = UIView()
            shadowView.backgroundColor = UIColor.clear
            shadowView.layer.shadowColor = UIColor.black.cgColor
            shadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
            shadowView.layer.shadowOpacity = 0.2
            shadowView.layer.shadowRadius = 15 / 2.0    // Sketch Blur / 2.0
            shadowView.layer.shadowPath = nil
            
            // rasterize shadow
            shadowView.layer.shadowPath = UIBezierPath(roundedRect: level.bounds, cornerRadius: 20).cgPath
            shadowView.layer.shouldRasterize = true
            shadowView.layer.rasterizationScale = UIScreen.main.scale
            
            level.addSubview(shadowView)
            
            // add button subview to overlay the shadow view
            let borderView = UIView()
            borderView.frame = level.bounds
            borderView.layer.cornerRadius = 20
            borderView.layer.masksToBounds = true
            shadowView.addSubview(borderView)
            
            // add content for button subview
            let borderViewContent = UIImageView()
            borderViewContent.image = UIImage(named: "ButtonBg")
            borderViewContent.frame = borderView.bounds
            borderView.addSubview(borderViewContent)
        }
        
        // TODO: Are we using this code? Line 80-82
        // bran: yes, of course
        BeginLabel?.text = beginTitle
        IntermediateLabel?.text = IntermTitle
        AdvancedLabel?.text = AdvnTitle
        BeginLabel.dynamicFont(textStyles: .title2, weight: .bold, dynamicType: true)
        IntermediateLabel.dynamicFont(textStyles: .title2, weight: .bold, dynamicType: true)
        AdvancedLabel.dynamicFont(textStyles: .title2, weight: .bold, dynamicType: true)
        
        // Workout Levels Descriptions
        func levelText(labelText: String, color: UIColor) -> NSAttributedString {
            let timeSymbolAttachment = NSTextAttachment()
            timeSymbolAttachment.image = UIImage(systemName: "timer",
                                                 withConfiguration: UIImage.SymbolConfiguration(weight: .bold))?.withTintColor(color)
            let label = NSMutableAttributedString(string: "")
            label.append(NSAttributedString(attachment: timeSymbolAttachment))
            label.append(NSAttributedString(string: " \(labelText)"))
            
            return label
        }
        
        ExercisesBeginnerLabel?.attributedText = levelText(labelText: BeginTimes, color: #colorLiteral(red: 0.1411764706, green: 0.6156862745, blue: 0.831372549, alpha: 1))
        ExercisesIntermLabel?.attributedText = levelText(labelText: IntermTimes, color: #colorLiteral(red: 0.3176470588, green: 0.7019607843, blue: 0.3333333333, alpha: 1))
        ExercisesAdvnLabel?.attributedText = levelText(labelText: AdvnTimes, color: #colorLiteral(red: 0.9450980392, green: 0.2392156863, blue: 0.2823529412, alpha: 1))
        ExercisesBeginnerLabel.dynamicFont(textStyles: .body, weight: .regular, dynamicType: true)
        ExercisesIntermLabel.dynamicFont(textStyles: .body, weight: .regular, dynamicType: true)
        ExercisesAdvnLabel.dynamicFont(textStyles: .body, weight: .regular, dynamicType: true)
        
        speak()
    }
    
    func speak() {
        speechService.say("Each level has a different type of workout and durations, for beginner with 16 minutes minimum, intermediate with 18 minutes minimum, and advanced 21 minutes minimum.")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        // Hide navigation bar background
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        
        // Show navigation bar background
        // self.navigationController?.navigationBar.setBackgroundImage(nil, for:.default)
        // self.navigationController?.navigationBar.shadowImage = nil
        // self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is Beginner {
            let vc = segue.destination as? Beginner
            vc?.titleLabel = beginTitle
            vc?.exerciseTime = BeginTimes
        }
        else if segue.destination is Intermediate {
            let vc = segue.destination as? Intermediate
            vc?.titleLabel = IntermTitle
            vc?.exerciseTime = IntermTimes
        }
        else if segue.destination is Advanced {
            let vc = segue.destination as? Advanced
            vc?.titleLabel = AdvnTitle
            vc?.exerciseTime = AdvnTimes
        }
        
        speechService.stop()
    }
    
}
