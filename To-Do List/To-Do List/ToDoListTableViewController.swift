//
//  ToDoListTableViewController.swift
//  To-Do List
//
//  Created by Nicolas Zoghb on 3/1/16.
//  Copyright © 2016 Nicolas Zoghb. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //delete completed tasks over 24 hours
        let yesterday = NSDate(timeIntervalSinceNow: -3600*24)
        for i in self.completedItems {
            if yesterday.earlierDate(i.completionDate) == i.completionDate && i.completed{
                self.completedItems.removeAtIndex(completedItems.indexOf(i)!)
            }
        }
        tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.toDoItems.count
    }
    
    //sets text of cell, according to what was typed into the textbox
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellIndentifier: NSString = "ListPrototypeCell"
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellIndentifier as String)! as UITableViewCell
        let todoitem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as! ToDoItem
        cell.textLabel!.text = todoitem.itemName as String + String(self.completedItems.count)
        //display date with the subtitle
        let timestamp = NSDateFormatter.localizedStringFromDate(todoitem.creationDate, dateStyle: .MediumStyle, timeStyle: .ShortStyle)
        if todoitem.subtitle.length > 0 {
            cell.detailTextLabel!.text = (todoitem.subtitle as String) + "\t" + "||" + "\t" + timestamp
        } else {
            cell.detailTextLabel!.text = timestamp
        }
        //cell accessories
        if todoitem.completed{
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
        return cell
    }
    
    //assign checkmark to completed tasks (on tap)
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let tappedItem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as! ToDoItem
        tappedItem.completed = !tappedItem.completed
        //add to completed list
        if tappedItem.completed {
            self.completedItems.append(tappedItem)
        } else {
            self.completedItems.removeAtIndex(completedItems.indexOf(tappedItem)!)
        }
        tableView.reloadData()
    }
    
    //swipe to delete (citation: http://stackoverflow.com/questions/24103069/swift-add-swipe-to-delete-tableviewcell )
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //delete cell if swiped
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from array and updating the tableview)
            self.toDoItems.removeObjectAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    //unwind functions
    @IBAction func unwindToTableViewController(segue:UIStoryboardSegue) {
    }
    
    //executes adding to array
    @IBAction func unwindToList(segue:UIStoryboardSegue){
        let source: AddNewItemViewController = segue.sourceViewController as! AddNewItemViewController
        //account for empty task
        if let _ = source.toDoItemInstance?.itemName.length {
            let item: ToDoItem = source.toDoItemInstance!
            self.toDoItems.addObject(item)
            self.tableView.reloadData()
        }
        return
    }
    
    //array containing cells with textLabel and detailTextLabel
    var toDoItems: NSMutableArray = []
    
    //array containing completed cells
    var completedItems = [ToDoItem]()
    
    
    
    
    
    

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
