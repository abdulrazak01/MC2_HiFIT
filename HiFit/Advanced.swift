//
//  Advanced.swift
//  HiFit
//
//  Created by Omar Tan Johan Tan on 26/05/20.
//  Copyright © 2020 AbdulRazak. All rights reserved.
//

import Foundation
import UIKit

class Advanced : UIViewController {
    
    @IBOutlet weak var TitleBegin: UILabel!
    @IBOutlet weak var Times: UILabel!
    @IBOutlet weak var DescriptionTextAdvn: UILabel!
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
        List(img: "HalfPushUps", name: "Half Push Ups"),
        List(img: "JumpSquat", name: "Squat Jump"),
        List(img: "ShoulderStretch", name: "Shoulder Stretch"),
        List(img: "Plank", name: "Plank")
    ]
    
    let speechService = SpeechService()
    var titleLabel: String = ""
    var exerciseTime: String = ""
    var descripts: String = "The advanced level workout are create for who has a good knowledge and routinely do workout."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TitleBegin?.text = titleLabel
        Times?.text = exerciseTime
        DescriptionTextAdvn?.text = descripts
        
        let buttonSelectorRadius:CGFloat = 20
        
        ButtonStart.layer.cornerRadius = buttonSelectorRadius
        
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
        
        DescriptionTextAdvn.font = UIFont.preferredFont(forTextStyle: .body)
        DescriptionTextAdvn.adjustsFontForContentSizeCategory = true
        
        labelExercise.font = UIFont.preferredFont(forTextStyle: .headline)
        labelExercise.adjustsFontForContentSizeCategory = true
    }
}
extension Advanced: UITableViewDelegate, UITableViewDataSource {
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
