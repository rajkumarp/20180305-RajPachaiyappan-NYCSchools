//
//  ScoreCollectionViewCell.swift
//  20180305-RajPachaiyappan-NYCSchools
//
//  Created by Rajkumar Pachaiyappan on 3/6/18.
//  Copyright © 2018 Rajkumar Pachaiyappan. All rights reserved.
//

import UIKit

class ScoreCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreNameLabel: UILabel!
    
    override func awakeFromNib() {
        addRoundedRect()
    }
    
    func addRoundedRect() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 4.0
    }
    
    func setSchoolDetails(title:String,score:String) {
        self.scoreLabel.text = score
        self.scoreNameLabel.text = title
    }
    
    
    
}
