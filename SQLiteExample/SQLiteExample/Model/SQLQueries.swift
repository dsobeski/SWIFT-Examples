//
//  SQLQueries.swift
//  SQLiteExample
//
//  Created by David Sobeski on 6/13/14.
//  Copyright (c) 2014 demo. All rights reserved.
//

import Foundation

struct SQLQueries
{
    static let GetNumberOfWords:    String = "SELECT COUNT(Word) FROM Words"
    static let GetWords:            String = "SELECT Id, Word FROM Words"
}