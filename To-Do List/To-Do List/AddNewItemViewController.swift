//
//  ViewController.swift
//  To-Do List
//
//  Created by Nicolas Zoghb on 3/1/16.
//  Copyright © 2016 Nicolas Zoghb. All rights reserved.
//

import UIKit

class AddNewItemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var toDoItemInstance: ToDoItem?
    
    @IBOutlet weak var TextField: UITextField!
    
    @IBOutlet weak var DoneButton: UIBarButtonItem!
    
    @IBOutlet weak var SubField: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if sender as? NSObject != self.DoneButton{
            return
        }
        if !self.TextField.text!.isEmpty{
            self.toDoItemInstance = ToDoItem(name: self.TextField.text!, sub: self.SubField.text!)
        }
    }
    
    
    
    //Hide keyboard
//    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
//        self.view.endEditing(true)
//    }
    
}

