//
//  PPSqlite.m
//  定制
//
//  Created by pinping on 13-4-2.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import "PPSqlite.h"

@implementation PPSqlite

- (void) openTheCreate
{
		NSLog(@"数据库创建中");
		NSString *database_path = [OperateFilePlist dataFilePath:nil FileName:DBNAME FileType:nil];
		if (sqlite3_open([database_path UTF8String], &db) != SQLITE_OK) {
				sqlite3_close(db);
				NSLog(@"数据库打开失败");
		}
}

- (void) execSql: (NSString *)sql
{
    char *err;
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"数据库操作数据失败!");
    }
}

@end
