//
//  Words.swift
//  SQLiteExample
//
//  Created by David Sobeski on 6/13/14.
//  Copyright (c) 2014 demo. All rights reserved.
//

import Foundation
import UIKit

//
//  This class represents our word. A word contains both a unique id and the actual word.
//
class WordItem
{
    var id: Int = 0
    var word: String = ""
}

//
//  Our Words class is our Word Model. It connects to the Words Database that is managed by the
//  database manager. This model object is used to perform queries and other manipulations of the
//  word data.
//
class Words
{
    // ---------------------------------------------------------------------------------------------
    // MARK: - External Methods
    
    //
    //  Retrieve the number of words that we have in our model (database).
    //
    func getCount() -> Int
    {
        return self.performCountQuery(SQLQueries.GetNumberOfWords)
    }
    
    //
    //  Retrieve a list of word items from our model (database).
    //
    func getWordItems() -> WordItem[]
    {
        return self.performQuery(SQLQueries.GetWords)
    }
    
    //
    //  Retrieve a list of words from our model (database).
    //
    func getWords() -> String[]
    {
        //
        //  Fetch a list of all of our word items.
        //
        let wordItems: WordItem[] = self.getWordItems()
        
        //
        //  Walk the list and just take out the words and put them in our new array of strings
        //  (words).
        //
        var words: String[] = []
        for item in wordItems
        {
            words.append(item.word)
        }
        
        return words 
    }
    
    // ---------------------------------------------------------------------------------------------
    // MARK: - Internal Methods
    
    //
    //  This method performs any query that will return a WordItem from a SELECT statement.
    //
    func performQuery(query: String) -> WordItem[]
    {
        //
        //  Fetch our Words Database from the application delegate.
        //
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        //
        //  Our SQL statement pointer that will be allocated by the prepare call. And, our count
        //  that returns the number of items we found.
        //
        var sqlStatement: COpaquePointer = nil
        
        //
        //  The list of Words that we will fetch from our query.
        //
        var words: WordItem[]
        words = []
        
        //
        //  If our wordDatabase is nil or not allocated, we must return nil since we were not
        //  able to return any words.
        //
        if appDelegate.dbManager.wordDatabase == nil
        {
            return words
        }
        
        //
        //  Since we pass SWIFT string types around, we need to convert that string to a CString.
        //  The process goes something like, cast the query string to an NSString, then cast that
        //  to a CString using the NSString's UTF8String encoding.
        //
        var nsQuery: NSString = query
        var csQuery: CString = nsQuery.UTF8String
        
        //
        //  Perform our SQL query.
        //
        if sqlite3_prepare_v2(appDelegate.dbManager.wordDatabase, csQuery, -1, &sqlStatement, nil) == SQLITE_OK
        {
            while sqlite3_step(sqlStatement) == SQLITE_ROW
            {
                //
                //  Fetch the ID and the WORD from our sql statement
                //
                let id: CInt = sqlite3_column_int(sqlStatement, 0)
                let cWord: UnsafePointer<CUnsignedChar> = sqlite3_column_text(sqlStatement, 1)
                
                //
                //  Since we are dealing with C char *, we need to perform the appropriate
                //  conversion to turn our char * into a SWIFT String.
                //
                let cString: CString = CString(cWord)
                let word: String = String.fromCString(cString)
                
                //
                //  Create a new WordItem and then set the id and word for the item.
                //
                let wordItem: WordItem = WordItem()
                wordItem.id = Int(id)
                wordItem.word = word
                
                //
                //  Add the item to our WordItem array. This is a list of all our valid word
                //  items that we will eventually return to the caller.
                //
                words.append(wordItem)
            }
            
            sqlite3_finalize(sqlStatement)
        }
        
        return words
    }
    
    //
    //  This method performs any query type that simply returns a COUNT from a SELECT statment.
    //
    func performCountQuery(query: String) -> Int
    {
        //
        //  Fetch our Words Database from the application delegate.
        //
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        //
        //  Our SQL statement pointer that will be allocated by the prepare call. And, our count
        //  that returns the number of items we found.
        //
        var sqlStatement: COpaquePointer = nil
        var count: CInt = 0
        
        //
        //  If our wordDatabase is nil or not allocated, we must return a count of 0 and simply
        //  exit.
        //
        if appDelegate.dbManager.wordDatabase == nil
        {
            return Int(count)
        }
        
        //
        //  Since we pass SWIFT string types around, we need to convert that string to a CString.
        //  The process goes something like, cast the query string to an NSString, then cast that
        //  to a CString using the NSString's UTF8String encoding.
        //
        var nsQuery: NSString = query
        var csQuery: CString = nsQuery.UTF8String
        
        //
        //  Perform our SQL query.
        //
        if sqlite3_prepare_v2(appDelegate.dbManager.wordDatabase, csQuery, -1, &sqlStatement, nil) == SQLITE_OK
        {
            while sqlite3_step(sqlStatement) == SQLITE_ROW
            {
                count = sqlite3_column_int(sqlStatement, 0)
            }
            
            sqlite3_finalize(sqlStatement)
        }
        
        return Int(count)
    }
}