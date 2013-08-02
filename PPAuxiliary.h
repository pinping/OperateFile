//
//  PPAuxiliary.h
//  定制
//
//  Created by pinping on 13-4-16.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPOperateFile.h"


typedef enum {
    
    // 传入数据为空。
    PPErrorDomain_NothingToNull = -11,
    
} PPAErrorCode;


@class PPOperateFile;

@interface PPAuxiliary : NSObject

+ (NSArray *)MacLoveRepeat:(NSArray *)RepeatArr error:(NSError **)outError;

+ (NSArray *)PPinvertedArray:(NSArray *)aArray error:(NSError **)outError;

+ (NSArray *)PPqueryFilePath:(NSString *)FilePath error:(NSError **)outError;

+ (NSString *)generateTradeNOPlist;

+ (NSString *)generateTradeNO;

+(NSString *)PPGetOrderNO:(NSString *)aStr;

+(NSString *)PPGetNowTime;

+(NSString *)machineName;

@end