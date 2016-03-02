//
//  ToDoItem.swift
//  To-Do List
//
//  Created by Nicolas Zoghb on 3/1/16.
//  Copyright © 2016 Nicolas Zoghb. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    
    var itemName: NSString = ""
    var subtitle: NSString = ""
    var completed: Bool = false
    var creationDate: NSDate = NSDate()
    var completionDate: NSDate = NSDate()
    
    init(name:String, sub:String){
        self.itemName = name
        self.subtitle = sub
        
    }

}
