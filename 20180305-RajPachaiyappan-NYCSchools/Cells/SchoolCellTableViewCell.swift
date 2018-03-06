//
//  SchoolCellTableViewCell.swift
//  20180305-RajPachaiyappan-NYCSchools
//
//  Created by Rajkumar Pachaiyappan on 3/5/18.
//  Copyright © 2018 Rajkumar Pachaiyappan. All rights reserved.
//

import UIKit

class SchoolCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var schoolNameLabel: UILabel!
    
    func setSchoolLabelCell(_ school:Schools) {
        self.schoolNameLabel.text = school.school_name
    }


}
