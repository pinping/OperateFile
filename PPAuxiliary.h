//
//  PPAuxiliary.h
//  定制
//
//  Created by pinping on 13-4-16.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPOperateFile.h"

@class PPOperateFile;

@interface PPAuxiliary : NSObject


+ (NSArray *) MacLoveRepeat:(NSArray *)RepeatArr;

+ (NSArray *)queryFilePath: (NSString *)FilePath;

+ (NSString *)generateTradeNOPlist;

+ (NSString *)generateTradeNO;

@end
