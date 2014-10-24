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
    
    @IBOutlet var taskTable:UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return todoItems.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel.text = todoItems[indexPath.row]
        return cell
    }

    
    override func viewWillAppear(animated: Bool) {
        
        if var storedItems: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("items"){
            
            //we need to reset the todo array or it will repeat its self each time
            todoItems = []
            
            var storedItemsNSArray = storedItems as NSArray
            
            for var i = 0; i < storedItemsNSArray.count; ++i{
                
                todoItems.append(storedItemsNSArray[i] as NSString)
            }
        }
  
        taskTable?.reloadData()
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            
            todoItems.removeAtIndex(indexPath.row)
            
            let fixedTodoItems = todoItems
            
            NSUserDefaults.standardUserDefaults().setValue(fixedTodoItems, forKey: "items")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            tableView.reloadData()
        }
        
    }
    

}

