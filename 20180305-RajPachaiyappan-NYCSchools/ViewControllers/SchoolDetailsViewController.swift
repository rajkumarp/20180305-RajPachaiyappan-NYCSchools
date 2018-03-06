//
//  SchoolDetailsViewController.swift
//  20180305-RajPachaiyappan-NYCSchools
//
//  Created by Rajkumar Pachaiyappan on 3/6/18.
//  Copyright © 2018 Rajkumar Pachaiyappan. All rights reserved.
//

import UIKit

class SchoolDetailsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    @IBOutlet weak var collectionView: UICollectionView!
    var schoolName:String?
    @IBOutlet weak var schoolNameLabel: UILabel!
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 15.0, bottom: 20.0, right: 15.0)
    var schoolDetails:SchoolDetails?
    let titleArray:Array = ["Maths","Reading","Writing"]
    var dataDict:Dictionary<String, String>?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.schoolNameLabel.text = self.schoolName
        getSchoolDetails()
        // Do any additional setup after loading the view.
    }
    
    func getSchoolDetails() {
        ServiceManager.shared().getSATScoreList(self.schoolName!, success: { (schoolDetails) in
            print(schoolDetails)
            self.schoolDetails = schoolDetails.first
            self.createDataDict()
            self.collectionView.reloadData()
        }) { (error) in
            print(error)
            AppUtils.shared().showAlert(with: AppConstants.errorTitle, message: AppConstants.errorMsg, presentingController: self)
        }
    }
    
    func createDataDict() {
        guard self.schoolDetails != nil else {
            return
        }
        dataDict = Dictionary.init()
        dataDict![titleArray[0]] = self.schoolDetails?.sat_math_avg_score
        dataDict![titleArray[1]] = self.schoolDetails?.sat_critical_reading_avg_score
        dataDict![titleArray[2]] = self.schoolDetails?.sat_writing_avg_score
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - CollectionView datasource and delegates
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard self.schoolDetails != nil  else {
            return 0
        }
        return AppConstants.noOfItemsInRow
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppConstants.scoreCellIdentifier,
                                                      for: indexPath) as! ScoreCollectionViewCell
        if let dataDict = self.dataDict {
            cell.setSchoolDetails(title: titleArray[indexPath.row], score: dataDict[titleArray[indexPath.row]]!)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (CGFloat(AppConstants.noOfItemsInRow) + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / CGFloat(AppConstants.noOfItemsInRow)
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }

}
