//
//  ViewController.swift
//  TodoList
//
//  Created by babykang on 15/4/23.
//  Copyright (c) 2015年 Fiona. All rights reserved.
//

import UIKit

var todos:[TodoModel] = []

func dateFromString(dateStr: String)->NSDate?{
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.dateFromString(dateStr)
    return date
}

class ViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate{

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        todos = [TodoModel(id:"1", title:"go shopping", date: dateFromString("2015-04-27")!),
        TodoModel(id:"2", title:"go sleeping", date: dateFromString("2015-04-27")!),
        TodoModel(id:"3", title:"go boating", date: dateFromString("2015-04-27")!),
        TodoModel(id:"4", title:"watch tv", date: dateFromString("2015-04-27")!)]
        
        navigationItem.leftBarButtonItem = editButtonItem()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
         return todos.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = self.tableView.dequeueReusableCellWithIdentifier("todoCell") as UITableViewCell
        /*var todo : TodoModel
        if tableView == searchDisplayController?.searchResultsTableView{
            todo = filteredTodos[indexPath.row] as TodoModel
        }else{
            todo = todos[indexPath.row] as TodoModel
        }
   */
        var todo = todos[indexPath.row]
        var title = cell.viewWithTag(100) as UILabel
        var date = cell.viewWithTag(101) as UILabel
        
        
        title.text = todo.title
        let local = NSLocale.currentLocale()
        let dateFormat = NSDateFormatter.dateFormatFromTemplate("yyyy-MM-dd", options: 0, locale: local)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        date.text = dateFormatter.stringFromDate(todo.date)
        return cell
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            todos.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
    }
    
    
    @IBAction func close(segue: UIStoryboardSegue){
        println("close")
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditTodo"{
          var vc = segue.destinationViewController as DetailViewController
          var indexPath = tableView.indexPathsForSelectedRows()
            if let index = indexPath {
                vc.todo = todos[index.count]
                
            }
        }
    }
    //move cell
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return editing
    }
    //move A to B
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let todo = todos.removeAtIndex(sourceIndexPath.row)
        todos.insert(todo, atIndex: destinationIndexPath.row)
    }
    
    /*search
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool{
        filteredTodos = todos.filter(){$0.title.rangeOfString(searchString) != nil}
        return true
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }*/
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

