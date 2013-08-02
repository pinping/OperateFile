//
//  PPSqlite.h
//  定制
//
//  Created by pinping on 13-4-2.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface PPSqlite : NSObject
{
    sqlite3 *db;
}

//- (void) openTheCreate;
- (void) openSqlite:(NSString *)sql;
- (void) execSql: (NSString *)sql;
- (NSString *)selectSql;
-(void)closeSql;
@end
