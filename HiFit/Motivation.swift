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
    
    @IBOutlet weak var imgView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        
        imgView.layer.cornerRadius = 20
        
    }
    
      
    
    
   @IBAction func shareButton(_ sender: Any) {
          let activityVC = UIActivityViewController (activityItems: ["www.google.com"], applicationActivities: nil)
          activityVC.popoverPresentationController?.sourceView = self.view
          self.present(activityVC, animated: true, completion: nil)
          
      }
    
}