//
//  DetailViewController.swift
//  TodoList
//
//  Created by babykang on 15/4/23.
//  Copyright (c) 2015年 Fiona. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var todoItem: UITextField!
    @IBOutlet weak var todoDate: UIDatePicker!
    
    var todo : TodoModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        todoItem.delegate = self
        if todo == nil{
            navigationController?.title = "新增todo"
        }else{
            navigationController?.title = "修改todo"
            todoItem.text = todo?.title
            todoDate.setDate((todo?.date)!, animated: false)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        todoItem.resignFirstResponder()
    }

    @IBAction func okTapped(sender: UIButton) {
        if todo == nil{
        let uuid = NSUUID().UUIDString
        var todo = TodoModel(id: "uuid", title: todoItem.text, date: todoDate.date)
        todos.append(todo)
        }else{
            todo?.title = todoItem.text
            todo?.date = todoDate.date
        }
    }
   
}
