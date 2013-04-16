//
//  PPSqlite.h
//  定制
//
//  Created by pinping on 13-4-2.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MacPublicImoprt.h"


@interface PPSqlite : NSObject
{
    sqlite3 *db;
}

- (void) openTheCreate;
- (void) execSql: (NSString *)sql;
@end
