//
//  CourseTableViewCell.swift
//  GradeCoach
//
//  Created by Connor Wybranowski on 4/25/15.
//  Copyright (c) 2015 Wybro. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var goal: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
