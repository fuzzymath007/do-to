//
//  SecondViewController.swift
//  do to
//
//  Created by Matthew Chess on 10/20/14.
//  Copyright (c) 2014 matthewchess. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var todoTextField: UITextField!

    @IBAction func addToDo(sender: AnyObject) {
        
        todoItems.append(todoTextField.text)
        
        NSUserDefaults.standardUserDefaults().setValue(todoItems, forKey: "items")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        var storedItems: AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("items")
        
        self.view.endEditing(true)
        
        println(storedItems)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        todoTextField.resignFirstResponder()
        return true
        
    }

    
}

