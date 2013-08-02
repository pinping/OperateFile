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

-(NSString *)selectSql
{
		
		NSString *sql = @"SELECT * FROM pdname";
		sqlite3_stmt *statement;
		NSString *tempStr;
		
		if (sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil) == SQLITE_OK) {
				
				while (sqlite3_step(statement) == SQLITE_ROW) {
						
						char *sqlName01 = (char*)sqlite3_column_text(statement, 0);
						NSString *nameStr01 = [[NSString alloc]initWithUTF8String:sqlName01];
						
						char *sqlName02 = (char*)sqlite3_column_text(statement, 1);
						NSString *nameStr02 = [[NSString alloc]initWithUTF8String:sqlName02];
						
						char *sqlName03 = (char*)sqlite3_column_text(statement, 2);
						NSString *nameStr03 = [[NSString alloc]initWithUTF8String:sqlName03];
						
						char *sqlName04 = (char*)sqlite3_column_text(statement, 3);
						NSString *nameStr04 = [[NSString alloc]initWithUTF8String:sqlName04];
						
						char *sqlName05 = (char*)sqlite3_column_text(statement, 4);
						NSString *nameStr05 = [[NSString alloc]initWithUTF8String:sqlName05];
						tempStr = [NSString stringWithFormat:@"%@/%@/%@/%@/%@",nameStr01,nameStr02,nameStr03,nameStr04,nameStr05];
						
				}
		}
		return tempStr;
}

-(void)closeSql
{
		sqlite3_close(db);
}

@end
