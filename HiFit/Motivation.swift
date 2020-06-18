//
//  Motivation.swift
//  HiFit
//
//  Created by Rian Rusmaldi on 30/05/20.
//  Copyright © 2020 AbdulRazak. All rights reserved.
//

import UIKit
import AVFoundation

class Motivation: UIViewController {
    
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var imgView: UIImageView!

    @IBOutlet weak var doneText: UILabel!
    
    @IBOutlet weak var motivationText: UILabel!
    
    @IBOutlet weak var workoutText: UILabel!
    
    @IBOutlet weak var circuitText: UILabel!
    
    @IBOutlet weak var minutesText: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        
        imgView.layer.cornerRadius = 20
        shareButton.layer.cornerRadius = 20
        doneButton.layer.cornerRadius = 20
        
        shareButton.titleLabel?.adjustsFontForContentSizeCategory = true
        
        doneButton.titleLabel?.adjustsFontForContentSizeCategory = true
        
        doneText.dynamicFont(textStyles: .title2, weight: .regular, dynamicType: true)
        
        motivationText.dynamicFont(textStyles: .largeTitle, weight: .regular, dynamicType: true)
        
        workoutText.dynamicFont(textStyles: .title2, weight: .regular, dynamicType: true)
        
        circuitText.dynamicFont(textStyles: .title2, weight: .regular, dynamicType: true)
        
        minutesText.dynamicFont(textStyles: .title2, weight: .regular, dynamicType: true)
        
        
    }
    
      
    
    
   @IBAction func shareButton(_ sender: Any) {
          let activityVC = UIActivityViewController (activityItems: ["www.google.com"], applicationActivities: nil)
          activityVC.popoverPresentationController?.sourceView = self.view
          self.present(activityVC, animated: true, completion: nil)
          
    imgView.layer.cornerRadius = 20
    
    
      }
    
}
