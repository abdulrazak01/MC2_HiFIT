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
    
    
    @IBOutlet weak var levelBeginner: UIButton!
    @IBOutlet weak var levelIntermediate: UIButton!
    @IBOutlet weak var levelAdvanced: UIButton!
    @IBOutlet weak var BeginLabel: UILabel!
    @IBOutlet weak var IntermediateLabel: UILabel!
    @IBOutlet weak var AdvancedLabel: UILabel!
    @IBOutlet weak var ExercisesBeginnerLabel: UILabel!
    @IBOutlet weak var ExercisesIntermLabel: UILabel!
    @IBOutlet weak var ExercisesAdvnLabel: UILabel!
    
    
    var beginTitle: String = "Beginner"
    var BeginTimes: String = "10 Exercises, 10:00 Minutes"
    
    var IntermTitle: String = "Intermediate"
    var IntermTimes: String = "17 Exercises, 20:00 Minutes"
    
    var AdvnTitle: String = "Advanced"
    var AdvnTimes: String = "25 Exercises, 30:00 Minutes"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let buttonSelectorRadius:CGFloat = 20
        
        levelBeginner.layer.cornerRadius = buttonSelectorRadius
        levelIntermediate.layer.cornerRadius = buttonSelectorRadius
        levelAdvanced.layer.cornerRadius = buttonSelectorRadius
        
        // Button Normal State
        levelBeginner.setBackgroundImage(#imageLiteral(resourceName: "BeginnerBg"), for: .normal)
        levelIntermediate.setBackgroundImage(#imageLiteral(resourceName: "IntermediateBg"), for: .normal)
        levelAdvanced.setBackgroundImage(#imageLiteral(resourceName: "AdvancedBg"), for: .normal)
        
        levelBeginner.clipsToBounds = true
        levelIntermediate.clipsToBounds = true
        levelAdvanced.clipsToBounds = true
        
        BeginLabel?.text = beginTitle
        IntermediateLabel?.text = IntermTitle
        AdvancedLabel?.text = AdvnTitle
        
        ExercisesBeginnerLabel?.text = BeginTimes
        ExercisesIntermLabel?.text = IntermTimes
        ExercisesAdvnLabel?.text = AdvnTimes
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
    }
    
}
