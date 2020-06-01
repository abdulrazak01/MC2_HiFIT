//
//  TableViewCell.swift
//  HiFit
//
//  Created by Muhammad Syabran on 01/06/20.
//  Copyright © 2020 AbdulRazak. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageWorkout: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
