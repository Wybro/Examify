//
//  CourseWorkTableViewCell.swift
//  GradeCoach
//
//  Created by Connor Wybranowski on 4/26/15.
//  Copyright (c) 2015 Wybro. All rights reserved.
//

import UIKit

class CourseWorkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var courseWorkTitle: UILabel!
    @IBOutlet weak var courseWorkWeight: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
