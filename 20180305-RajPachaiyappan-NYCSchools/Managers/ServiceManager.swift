//
//  ServiceManager.swift
//  20180305-RajPachaiyappan-NYCSchools
//
//  Created by Rajkumar Pachaiyappan on 3/5/18.
//  Copyright © 2018 Rajkumar Pachaiyappan. All rights reserved.
//

import UIKit
import Alamofire

class ServiceManager: NSObject {
    private static var sharedSessionManager: ServiceManager = {
        let networkManager = ServiceManager(baseURL:AppConstants.baserURL)
        return networkManager
    }()
    
    // MARK: -
    
    let baseURL: String
    
    // Initialization
    
    private init(baseURL: String) {
        self.baseURL = baseURL
    }
    // MARK: - Accessors
    class func shared() -> ServiceManager {
        return sharedSessionManager
    }
    
    //https://data.cityofnewyork.us/resource/734v-jeq5.json
    func getNYCSchoolList(_ success:@escaping ([Schools])->Void, failure:@escaping (Error) -> Void) {
        let schoolListUrl = self.baseURL + AppConstants.schoolListPath
        Alamofire.request(schoolListUrl).validate().responseString { response in
            debugPrint("All Response Info: \(response)")
            switch response.result {
            case .success:
                let jsonData = response.value?.data(using: .utf8)!
                let decoder = JSONDecoder()
                let schools:Array = try! decoder.decode([Schools].self, from: jsonData!)
                success(schools)
                print("Validation Successful")
            case .failure(let error):
                print(error)
                failure(error)
            }
        }
    }
    
    func getSATScoreList(_ schoolName:String, success:@escaping ([SchoolDetails])->Void, failure:@escaping (Error) -> Void) {
        var urlString = self.baseURL + AppConstants.schoolDetailsListPath + schoolName
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed)!
        Alamofire.request(urlString).validate().responseString { response in
            debugPrint("All Response Info: \(response)")
            switch response.result {
            case .success:
                let jsonData = response.value?.data(using: .utf8)!
                let decoder = JSONDecoder()
                let schoolDetails:Array = try! decoder.decode([SchoolDetails].self, from: jsonData!)
                success(schoolDetails)
                print("Validation Successful")
            case .failure(let error):
                print(error)
                failure(error)
            }
        }
    }
    
    
    
    
}
