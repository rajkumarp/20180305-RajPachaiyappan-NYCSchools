//
//  ViewController.swift
//  20180305-RajPachaiyappan-NYCSchools
//
//  Created by Rajkumar Pachaiyappan on 3/5/18.
//  Copyright © 2018 Rajkumar Pachaiyappan. All rights reserved.
//

import UIKit

class NYCSchoolsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Mark: tableview delegates
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let schoolCell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return schoolCell
    }
    
    
    

}

