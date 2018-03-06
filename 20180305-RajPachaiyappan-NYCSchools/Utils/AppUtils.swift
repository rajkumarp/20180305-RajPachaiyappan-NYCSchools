//
//  AppUtils.swift
//  20180305-RajPachaiyappan-NYCSchools
//
//  Created by Rajkumar Pachaiyappan on 3/6/18.
//  Copyright © 2018 Rajkumar Pachaiyappan. All rights reserved.
//

import UIKit

class AppUtils: NSObject {

    private static var sharedUtil: AppUtils = {
        let sharedUtil = AppUtils()
        return sharedUtil
    }()

    private override init() {
    }
    
    // MARK: - Accessors
    class func shared() -> AppUtils {
        return sharedUtil
    }
    
    func showAlert(with title:String, message:String, presentingController:UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        presentingController.present(alert, animated: true)
    }
}
