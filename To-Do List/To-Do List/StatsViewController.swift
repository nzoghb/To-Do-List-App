//
//  StatsViewController.swift
//  To-Do List
//
//  Created by Nicolas Zoghb on 3/1/16.
//  Copyright © 2016 Nicolas Zoghb. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    var numberReceived: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lengthOfCompletedArray.text = String(numberReceived)
//        alterNumber(source.lengthInt)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var lengthOfCompletedArray: UILabel!
    
    
}
