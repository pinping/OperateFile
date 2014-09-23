//
//  PPAuxiliary.m
//  定制
//
//  Created by pinping on 13-4-16.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import "PPAuxiliary.h"
#import <sys/utsname.h>

NSString *const PPErrorDomain = @"PPAuxiliary__ErrorDomain";


@implementation PPAuxiliary


+ (NSArray *)PPRepeatArray:(NSArray *)RepeatArr error:(NSError **)outError
{
    NSDictionary *dict = [NSDictionary dictionaryWithObject:@"传入的数据有问题！" forKey:NSLocalizedDescriptionKey];

    if ((RepeatArr == NULL) || ([RepeatArr count] == 0)) {
        if (outError) {
            *outError = [NSError errorWithDomain:PPErrorDomain code:PPErrorDomain_NothingToNull userInfo:dict];
        }

        return NULL;
    }

    NSMutableArray *categoryArray = [[NSMutableArray alloc] init];

    for (unsigned i = 0; i < [RepeatArr count]; i++) {
        if ([categoryArray containsObject:[RepeatArr objectAtIndex:i]] == NO) {
            [categoryArray addObject:[RepeatArr objectAtIndex:i]];
        }
    }

    return categoryArray;
}


+ (NSArray *)PPInvertedArray:(NSArray *)aArray error:(NSError **)outError
{
    NSDictionary *dict = [NSDictionary dictionaryWithObject:@"传入的数据有问题！" forKey:NSLocalizedDescriptionKey];

    if ((aArray == NULL) || ([aArray count] == 0)) {
        if (outError) {
            *outError = [NSError errorWithDomain:PPErrorDomain code:PPErrorDomain_NothingToNull userInfo:dict];
        }

        return NULL;
    }

    NSMutableArray *categoryArray = [[NSMutableArray alloc] init];

    for (int i = (int)[aArray count]; i > 0; i--) {
        [categoryArray addObject:[aArray objectAtIndex:(i - 1)]];
    }

    return categoryArray;
}

+ (NSArray *)PPArraySortArray:(NSArray *)aArray Key:(NSString *)keystring isAscending:(BOOL)isAscending
{
    NSSortDescriptor* sortByA = [NSSortDescriptor sortDescriptorWithKey:keystring ascending:isAscending];
    return [[NSMutableArray alloc]initWithArray:[aArray sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortByA]]];
}


+ (NSArray *)PPQueryFilePath:(NSString *)FilePath error:(NSError **)outError
{
    NSDictionary *dict = [NSDictionary dictionaryWithObject:@"传入的数据有问题！" forKey:NSLocalizedDescriptionKey];

    if ((FilePath == NULL) || ([FilePath length] == 0)) {
        if (outError) {
            *outError = [NSError errorWithDomain:PPErrorDomain code:PPErrorDomain_NothingToNull userInfo:dict];
        }

        return NULL;
    }

    NSArray     *subpaths;
    NSString    *fontPath = [PPOperateFile PPdataFilePath:FilePath FileName:nil FileType:nil];

    NSFileManager *fileManager = [[NSFileManager alloc] init];
    subpaths = [fileManager subpathsAtPath:fontPath];

    return subpaths;
}


+ (NSString *)PPGenerateTradeTime
{
    NSDate * date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterFullStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *resultes = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    return resultes;
}


+ (NSString *)PPGenerateTradeTimeStr
{
    const int       N = 5;
    NSString        *sourceString = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *result = [[NSMutableString alloc] init];

    srand(time(0));

    for (int i = 0; i < N; i++) {
        unsigned    index = arc4random() % [sourceString length];
        NSString    *s = [sourceString substringWithRange:NSMakeRange(index, 1)];
        [result appendString:s];
    }

    return [result stringByAppendingFormat:@"%@", [self PPGenerateTradeTime]];
}


+ (NSString *)PPGetOrderNO:(NSString *)aStr
{
    NSDate          *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

    [formatter setDateStyle:NSDateFormatterFullStyle];
    [formatter setDateFormat:@"MMddHHmmss"];
    NSString    *resultes = [NSString stringWithFormat:@"%@", [formatter stringFromDate:date]];
    NSString    *tempStr = @"";

    for (int i = 0; i < 4 - aStr.length; i++) {
        tempStr = [tempStr stringByAppendingFormat:@"0"];
    }

    NSLog(@"resultes%@", [resultes stringByAppendingFormat:@"%@%@", tempStr, aStr]);

    return [resultes stringByAppendingFormat:@"%@%@", tempStr, aStr];
}


+ (NSString *)PPGetNowTime
{
    NSDate          *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

    [formatter setDateStyle:NSDateFormatterFullStyle];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString *resultes = [NSString stringWithFormat:@"%@", [formatter stringFromDate:date]];

    return resultes;
}


+ (NSString *)PPMachineName
{
    struct utsname systemInfo;

    uname(&systemInfo);

    NSString *machine = [NSString stringWithCString:systemInfo.machine
        encoding:NSUTF8StringEncoding];

    if ([machine isEqualToString:@"i386"] || [machine isEqualToString:@"x86_64"]) {
        machine = @"ios_Simulator";
    } else if ([machine isEqualToString:@"iPhone1,1"]) {
        machine = @"iPhone_1G";
    } else if ([machine isEqualToString:@"iPhone1,2"]) {
        machine = @"iPhone_3G";
    } else if ([machine isEqualToString:@"iPhone2,1"]) {
        machine = @"iPhone_3GS";
    } else if ([machine isEqualToString:@"iPhone3,1"]) {
        machine = @"iPhone_4";
    } else if ([machine isEqualToString:@"iPhone4,1"]) {
        machine = @"iPhone_4S";
    } else if ([machine isEqualToString:@"iPhone5,1"]) {
        machine = @"iPhone_5";
    } else if ([machine isEqualToString:@"iPhone5,2"]) {
        machine = @"iPhone_5";
    } else if ([machine isEqualToString:@"iPod1,1"]) {
        machine = @"iPod_Touch_1G";
    } else if ([machine isEqualToString:@"iPod2,1"]) {
        machine = @"iPod_Touch_2G";
    } else if ([machine isEqualToString:@"iPod3,1"]) {
        machine = @"iPod_Touch_3G";
    } else if ([machine isEqualToString:@"iPod4,1"]) {
        machine = @"iPod_Touch_4G";
    } else if ([machine isEqualToString:@"iPad1,1"]) {
        machine = @"iPad_1";
    } else if ([machine isEqualToString:@"iPad2,1"]) {
        machine = @"iPad_2";
    }

    return machine;
}

@end
