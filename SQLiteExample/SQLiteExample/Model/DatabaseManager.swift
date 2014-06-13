//
//  DatabaseManager.swift
//  SQLiteExample
//
//  Created by David Sobeski on 6/13/14.
//  Copyright (c) 2014 demo. All rights reserved.
//

import Foundation

class DatabaseManager
{
    // ---------------------------------------------------------------------------------------------
    // MARK: - Constants
    
    let kWordsDatabaseName: String      = "Words"
    let kWordsDatabaseExtension: String = "sqlite"
    
    // ---------------------------------------------------------------------------------------------
    // MARK: - Properties
    
    var wordDatabase: COpaquePointer = nil
    
    // ---------------------------------------------------------------------------------------------
    // MARK: - Object Lifecycle Management Methods
    
    //
    //  This is the initializer method for our object. We open all of our databases when the 
    //  DatabaseManager is initialized.
    //
    init()
    {
        //
        //  Open our words database.
        //
        self.openWordDatabase()
    }
    
    //
    //  This is called when we are "deinitialized".
    //
    deinit
    {
        //
        //  Close our opened words database.
        //
        sqlite3_close(self.wordDatabase)
    }
    
    // ---------------------------------------------------------------------------------------------
    // MARK: - Internal Helper Methods
    
    //
    //  This method will call the SQLite API to open our Words database.
    //
    func openWordDatabase() -> Bool
    {
        //
        //  We need to fetrch the path and filename for our database. Our sqlite db is located
        //  in the resource path of our main bundle.
        //
        var sqliteDatabaseName: NSString!
        
        sqliteDatabaseName = NSBundle.mainBundle().pathForResource(kWordsDatabaseName,
            ofType: kWordsDatabaseExtension)
        
        //
        //  If we were unable to fetch the path for the resource, then our sqlite database name
        //  will be nil. In this case, we can not open a database, so, alert our caller by returning
        //  false.
        //
        if sqliteDatabaseName == nil
        {
            return false
        }
        
        //
        //  Try to open the SQLite database.
        //
        let sqlerror = sqlite3_open(sqliteDatabaseName.UTF8String, &self.wordDatabase)
        
        //
        //  If we were not able to open, then we alert our caller that we failed by returning false.
        //
        if sqlerror != SQLITE_OK
        {
            return false
        }
        
        //
        //  We successfully opened our database, alert our caller of this fact by returning true.
        //
        return true
    }
}