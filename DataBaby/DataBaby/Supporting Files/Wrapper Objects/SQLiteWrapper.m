//
//  SQLiteWrapper.m
//  DataBaby
//
//  Created by David Sobeski on 6/6/14.
//  Copyright (c) 2014 demo. All rights reserved.
//

#import "SQLiteWrapper.h"

// -------------------------------------------------------------------------------------------------
#pragma mark - Internal Interface Definition

@interface SQLiteWrapper ()
{
}

@end

// -------------------------------------------------------------------------------------------------
#pragma mark - SQLiteWrapper Implementation

@implementation SQLiteWrapper

@synthesize database;

// -------------------------------------------------------------------------------------------------
#pragma mark - SQLiteWrapper Memory Management

//
//  Perform default initialization of the database object. We have two databases that we use
//  for our game. The first is the WORDS database. This is a READ-ONLY database. Since it is RO, we
//  simply need to open the database and it is fine being in the resource folder. The second
//  database is our GAMEDATA database. Since we need this database to be read and write, we actually
//  need to move the database (or copy) from the resource folder to the user's Documents folder.
//
- (id)init
{
    if ((self = [super init]))
    {
        self.database = nil;
    }
    
    return self;
}

//
//  The system calls us on this method to free any memory that we may have consumed.
//
- (void)dealloc
{
    sqlite3_close(database);
}

- (Boolean)openDatabase:(NSString *)name withExtension:(NSString *)extension
{
    //
    //  Get the location of our SQLite database.
    //
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSString *filename = [NSString stringWithFormat:@"%@.%@", name, extension];
    NSString *databaseLocation = [documentsDir stringByAppendingPathComponent:filename];
    
    //
    //  Open our database.
    //

    if (sqlite3_open([databaseLocation UTF8String], &database) != SQLITE_OK)
    {
        return NO;
    }
    
    return YES;
}

@end
