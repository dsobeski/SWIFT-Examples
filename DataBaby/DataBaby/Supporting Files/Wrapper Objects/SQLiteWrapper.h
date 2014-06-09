//
//  SQLiteWrapper.h
//  DataBaby
//
//  Created by David Sobeski on 6/6/14.
//  Copyright (c) 2014 demo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface SQLiteWrapper : NSObject
{
    sqlite3 *database;
}

@property (nonatomic, assign) sqlite3 *database;

- (Boolean)openDatabase:(NSString *)name withExtension:(NSString *)extension;

@end
