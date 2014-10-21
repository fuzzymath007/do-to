//
//  FirstViewController.swift
//  do to
//
//  Created by Matthew Chess on 10/20/14.
//  Copyright (c) 2014 matthewchess. All rights reserved.
//

import UIKit

var todoItems:[String] = []

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        cell.textLabel.text = "test"
        
        return cell
        
    }


}

