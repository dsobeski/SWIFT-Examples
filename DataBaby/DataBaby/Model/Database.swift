//
//  Database.swift
//  DataBaby
//
//  Created by David Sobeski on 6/6/14.
//  Copyright (c) 2014 demo. All rights reserved.
//

import Foundation

class Database
{
    var sqlite: SQLiteWrapper
    
    init()
    {
        sqlite = SQLiteWrapper();
        let didOpen: Boolean = sqlite.openDatabase("shoes", withExtension: "sqlite")
        
        println("Did open = \(didOpen)")
        
        if (didOpen == 1)
        {
            println("Database was found and opened")
        }
        else if (didOpen == 0)
        {
            println("Unable to open database")
        }
    }
}