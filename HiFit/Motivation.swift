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
        
        motivationText.dynamicFont(textStyles: .largeTitle, weight: .bold, dynamicType: true)
        
        workoutText.dynamicFont(textStyles: .title2, weight: .bold, dynamicType: true)
        
        circuitText.dynamicFont(textStyles: .title2, weight: .bold, dynamicType: true)
        
        minutesText.dynamicFont(textStyles: .title2, weight: .bold, dynamicType: true)
        
        //square.and.arrow.up
//        let timeSymbolAttachment = NSTextAttachment()
//                   timeSymbolAttachment.image = UIImage(systemName: "timer",
//                                                        withConfiguration: UIImage.SymbolConfiguration(weight: .bold))?.withTintColor(color)
//                   let label = NSMutableAttributedString(string: "")
//                   label.append(NSAttributedString(attachment: timeSymbolAttachment))
//                   label.append(NSAttributedString(string: " \(labelText)"))
        
        let attachmentImage = NSTextAttachment()
        attachmentImage.image = UIImage(systemName: "square.and.arrow.up", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))?.withTintColor(.systemBackground)
        
        let attachmentString = NSAttributedString(attachment: attachmentImage)
        let label = NSMutableAttributedString(string: "")
        label.append(attachmentString)
        let text = NSMutableAttributedString(string: " Share")
        label.append(text)

        shareButton.setAttributedTitle(label, for: .normal)
        shareButton.dynamicFont(textStyles: .title2, weight: .bold, dynamicType: true)
        
        doneButton.dynamicFont(textStyles: .title2, weight: .bold, dynamicType: true)
    }
    
      
    
    
   @IBAction func shareButton(_ sender: Any) {
          let activityVC = UIActivityViewController (activityItems: ["www.google.com"], applicationActivities: nil)
          activityVC.popoverPresentationController?.sourceView = self.view
          self.present(activityVC, animated: true, completion: nil)
          
    imgView.layer.cornerRadius = 20
    
    
      }
    
}
