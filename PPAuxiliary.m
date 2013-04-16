//
//  PPAuxiliary.m
//  定制
//
//  Created by pinping on 13-4-16.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import "PPAuxiliary.h"

@implementation PPAuxiliary
/**
 *	@brief	把传入的数组数据通过本方法去掉重复的数据
 *
 *  @param	RepeatArr传入一个数组参数
 *
 *	@return	返回一个去重的数组
 */
+ (NSArray *) MacLoveRepeat:(NSArray *) RepeatArr
{
		
		NSMutableArray	*categoryArray = [[NSMutableArray alloc] init];
		
		for (unsigned i = 0; i < [RepeatArr count]; i++){
				
				if ([categoryArray containsObject:[RepeatArr objectAtIndex:i]] == NO){
						
						[categoryArray addObject:[RepeatArr objectAtIndex:i]];
						
				}
		}
		
		return [categoryArray autorelease];
}


/**
 *	@brief	通过传入的字符串路径，查找该路径的所以文件，把所有文件的名称返回；
 *
 *  @param	FilePath传入一个字符串路径。
 *
 *	@return	返回所有文件的名称。
 */
+ (NSArray *) queryFilePath: (NSString *) FilePath {
		
		NSArray *subpaths;
		NSString *fontPath = [PPOperateFile dataFilePath:FilePath FileName:nil FileType:nil];
		
		NSFileManager *fileManager = [[NSFileManager alloc] init];
		subpaths = [fileManager subpathsAtPath:fontPath];
		
		return subpaths;
}


/**
 *	@brief	以时间为基础生成一个当前时间的字符串,例如：20130201；
 *
 *	@return	返回当前时间的字符串。
 */
+ (NSString *)generateTradeNOPlist{
    NSDate * date = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:kCFDateFormatterFullStyle];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSString *resultes = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    [formatter release];
    return resultes;
}


/**
 *	@brief	以时间为基础生成一个当前时间的字符串+5个随机的字符串,例如：ABCDE201302011034；
 *
 *	@return	返回当前时间的字符串+5个随机的字符串。
 */
+ (NSString *)generateTradeNO{
    const int N = 5;
    
    NSString *sourceString = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *result = [[[NSMutableString alloc] init] autorelease];
    srand(time(0));
    for (int i = 0; i < N; i++)
        {
				unsigned index = rand() % [sourceString length];
				NSString *s = [sourceString substringWithRange:NSMakeRange(index, 1)];
				[result appendString:s];
        }
    NSDate * date = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:kCFDateFormatterFullStyle];
    [formatter setDateFormat:@"yyyyMMddHHmm"];
    NSString *resultes = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    [formatter release];
    [result stringByAppendingFormat:@"%@",resultes];
    NSLog(@"resultes%@",[result stringByAppendingFormat:@"%@",resultes]);
    return [result stringByAppendingFormat:@"%@",resultes];
}
@end
