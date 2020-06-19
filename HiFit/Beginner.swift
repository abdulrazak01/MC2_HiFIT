//
//  Beginner.swift
//  HiFit
//
//  Created by Muhammad Syabran on 20/05/20.
//  Copyright © 2020 AbdulRazak. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Beginner : UIViewController {
    
    @IBOutlet weak var TitleBegin: UILabel!
    @IBOutlet weak var Times: UILabel!
    @IBOutlet weak var DescriptionTextBegin: UILabel!
    @IBOutlet weak var ButtonStart: UIButton!
    @IBOutlet weak var labelExercise: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    struct List {
        var img: String
        var name: String
    }
    
    let exercisesList = [
        List(img: "NeckMobility", name: "Neck Mobility"),
        List(img: "SumoSquat", name: "Sumo Squats"),
        List(img: "JumpingJacks", name: "Jumping Jacks"),
        List(img: "PushUps", name: "Push Ups"),
        List(img: "AirSwimming", name: "Air Swimming"),
        List(img: "ShoulderStretch", name: "ShoulderStretch")
    ]
    
    let speechService = SpeechService()
    var titleLabel: String = ""
    var exerciseTime: String = ""
    var descripts: String = "The Beginner level workout are create for who never or just begin to do workout."
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TitleBegin?.text = titleLabel
        Times?.text = exerciseTime
        DescriptionTextBegin?.text = descripts
        
        TitleBegin.dynamicFont(textStyles: .largeTitle, weight: .bold, dynamicType: true)
        
        let buttonSelectorRadius:CGFloat = 20
        ButtonStart.layer.cornerRadius = buttonSelectorRadius
        
        ButtonStart.dynamicFont(textStyles: .title3, weight: .bold, dynamicType: true)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        speak()
        configTextStyle()
    }
    
    func speak() {
        speechService.say("\(titleLabel) level has \(exercisesList.count) exercises to do, \(descripts)")
    }
    
    @IBAction func buttonStart(_ sender: Any) {
        speechService.stop()
    }
    
    func configTextStyle(){
        TitleBegin.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        TitleBegin.adjustsFontForContentSizeCategory = true
        
        Times.font = UIFont.preferredFont(forTextStyle: .headline)
        Times.adjustsFontForContentSizeCategory = true
        
        DescriptionTextBegin.font = UIFont.preferredFont(forTextStyle: .body)
        DescriptionTextBegin.adjustsFontForContentSizeCategory = true
        
        labelExercise.font = UIFont.preferredFont(forTextStyle: .headline)
        labelExercise.adjustsFontForContentSizeCategory = true
    }
    
}

extension Beginner: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercisesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        let title = exercisesList[indexPath.row]
        cell.labelTitle?.text = title.name
        cell.imageWorkout?.image = UIImage(named: title.img)
        // if want to use detail text
        //            cell.detailTextLabel?.text = title.img
        
        
        
        return cell
    }
}
