//
//  Beginner.swift
//  HiFit
//
//  Created by Muhammad Syabran on 20/05/20.
//  Copyright © 2020 AbdulRazak. All rights reserved.
//

import Foundation
import UIKit

class Beginner : UIViewController {
    
    @IBOutlet weak var TitleBegin: UILabel!
    @IBOutlet weak var Times: UILabel!
    @IBOutlet weak var DescriptionTextBegin: UILabel!
    @IBOutlet weak var ButtonStart: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    var titleLabel: String = ""
    var exerciseTime: String = ""
    var descripts: String = "This is beginner level workout are create for who never or just begin to do workout."
    
    let exercisesList = ["pushup","situp","jump"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TitleBegin?.text = titleLabel
        Times?.text = exerciseTime
        DescriptionTextBegin?.text = descripts
        
        let buttonSelectorRadius:CGFloat = 20
        ButtonStart.layer.cornerRadius = buttonSelectorRadius
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension Beginner: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercisesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        let title = exercisesList[indexPath.row]
        cell.labelTitle.text = title
        
        return cell
    }
    
 // Do Something Here Later
}
