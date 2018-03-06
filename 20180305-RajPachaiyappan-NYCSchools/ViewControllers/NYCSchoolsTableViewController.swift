//
//  ViewController.swift
//  20180305-RajPachaiyappan-NYCSchools
//
//  Created by Rajkumar Pachaiyappan on 3/5/18.
//  Copyright © 2018 Rajkumar Pachaiyappan. All rights reserved.
//

import UIKit

class NYCSchoolsTableViewController: UITableViewController {
    var schoolList:Array<Schools>?
    @IBOutlet weak var activityIndicator: CustomActivityIndicator!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getSchools()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupUI() {
        self.navigationItem.title = AppConstants.nycSchoolTitle
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = CGFloat(AppConstants.rowHeight)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        self.view.addConstraint(horizontalConstraint)
        
        let verticalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
        self.view.addConstraint(verticalConstraint)
    }
    
    func getSchools() {
        ServiceManager.shared().getNYCSchoolList({ (schools) in
            print(schools)
            self.schoolList = schools
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
        }) { (error) in
            self.activityIndicator.stopAnimating()
            AppUtils.shared().showAlert(with: AppConstants.errorTitle, message: AppConstants.errorMsg, presentingController: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: - Tableview datasource & delegates
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = self.schoolList?.count else {
            return 0
        }
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let schoolCell:SchoolCellTableViewCell =  tableView.dequeueReusableCell(withIdentifier: AppConstants.schoolCellIdentifier, for: indexPath) as! SchoolCellTableViewCell
        let school = self.schoolList![indexPath.row]
        schoolCell.setSchoolLabelCell(school)
        return schoolCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let school = self.schoolList![indexPath.row]
        self.performSegue(withIdentifier: AppConstants.nycSchoolSegue, sender: school.school_name)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(AppConstants.rowHeight)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == AppConstants.nycSchoolSegue {
            let schoolDetailsVC:SchoolDetailsViewController = segue.destination as! SchoolDetailsViewController
            schoolDetailsVC.schoolName = sender as? String
        }
    }
    
}

