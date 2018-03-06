//
//  AppConstants.swift
//  20180305-RajPachaiyappan-NYCSchools
//
//  Created by Rajkumar Pachaiyappan on 3/6/18.
//  Copyright © 2018 Rajkumar Pachaiyappan. All rights reserved.
//

import UIKit

class AppConstants  {
    
    //NYCSchoolsTableViewController
    
    static let nycSchoolTitle = "NYC Schools"
    static let rowHeight = 54
    static let schoolCellIdentifier = "SchoolCell"
    static let nycSchoolSegue = "SchoolDetailsSegue"
    
    //SchoolDetailsViewController
    static let scoreCellIdentifier = "ScoreCell"
    static let noOfItemsInRow = 3

    
    
    //Alert
    static let errorTitle = "Error"
    static let errorMsg = "We are sorry, but service is currently unavailable. Please try again later."
    
    //ServiceManager
    
    static let baserURL = "https://data.cityofnewyork.us"
    static let schoolListPath = "/resource/734v-jeq5.json"
    static let schoolDetailsListPath = "/resource/734v-jeq5.json?school_name="
    
    

    

}
