//
//  ErrorMessages.swift
//  PokerTracker
//
//  Created by David Sobeski on 6/5/14.
//  Copyright (c) 2014 osnine. All rights reserved.
//

import Foundation

//
//  The ErrorMessages object is use to contain all of the strings of our error messages that we
//  use internally to print to the console or to log.
//
struct ErrorMessage
{
    // ---------------------------------------------------------------------------------------------
    // MARK: - Error Messages
    
    static let errorInvalidEventName = "Unable to fire the event because the eventName is empty."
    
    // ---------------------------------------------------------------------------------------------
    // MARK: - Helper Functions
    
    //
    //  This method is used to print our internal error messages. This is a helper because in the
    //  future we might want to do more with error messages than simply writing them out to the
    //  debug console.
    //
    static func println(message: String)
    {
        println(message)
    }
    
}