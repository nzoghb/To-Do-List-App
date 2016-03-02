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
        TextField.becomeFirstResponder()
        //allows for tap recognition
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
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
    
    //hide keyboard when anywhere else press
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}

