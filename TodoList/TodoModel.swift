//
//  TodoModel.swift
//  TodoList
//
//  Created by babykang on 15/4/23.
//  Copyright (c) 2015年 Fiona. All rights reserved.
//

import UIKit

class TodoModel: NSObject {
    var id :String
    var title: String
    var date : NSDate
    
    init (id:String , title:String, date:NSDate){
        self.id = id
        self.title = title
        self.date = date
    }
   
}
