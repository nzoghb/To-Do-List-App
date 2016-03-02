//
//  TaskManager.swift
//  To-Do List
//
//  Created by Nicolas Zoghb on 2/23/16.
//  Copyright © 2016 Nicolas Zoghb. All rights reserved.
//

import UIKit

var TM: TaskManager = TaskManager()

struct item{
    var name = "name"
    var subtitle = "subtitle"
}

class TaskManager: NSObject {

    var list = [item]()
    
    func addTask(name: String, subtitle: String) {
        list.append(item(name: name, subtitle: subtitle))
    }
    
}
