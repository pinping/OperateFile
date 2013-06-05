//
//  PPSqlite.m
//  定制
//
//  Created by pinping on 13-4-2.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import "PPSqlite.h"

@implementation PPSqlite

- (void)openSqlite:(NSString *)sqlPath
{
    if (sqlite3_open([sqlPath UTF8String], &db) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"数据库打开失败");
    }
}

- (void)execSql:(NSString *)sql
{
    NSLog(@"数据库操作!%@", sql);
    char *err;

    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"数据库操作数据失败!");
    }

    NSLog(@"error: %s", err);
}

@end
