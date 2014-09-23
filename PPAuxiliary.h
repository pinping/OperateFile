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


/**
 *	@brief	把传入的数组数据通过本方法去掉重复的数据
 *
 *  @param	RepeatArr传入一个数组参数
 *
 *	@return	返回一个去重的数组
 */
+ (NSArray *)PPRepeatArray:(NSArray *)RepeatArr error:(NSError **)outError;

/**
 *	@brief	把传入的数组数据通过本方法把数组数据反转
 *
 *	@return	返回一个反转的数组
 */
+ (NSArray *)PPInvertedArray:(NSArray *)aArray error:(NSError **)outError;

/**
 *  根据关键字排序的数组
 *
 *  @param aArray      数组
 *  @param keystring   关键字
 *  @param isAscending 是否升序
 *
 *  @return 返回一个根据关键字排序的数组
 */
+ (NSArray *)PPArraySortArray:(NSArray *)aArray Key:(NSString *)keystring isAscending:(BOOL)isAscending;

/**
 *	@brief	通过传入的字符串路径，查找该路径的所以文件，把所有文件的名称返回；
 *
 *  @param	FilePath传入一个字符串路径。
 *
 *	@return	返回所有文件的名称。
 */
+ (NSArray *)PPQueryFilePath:(NSString *)FilePath error:(NSError **)outError;


/**
 *	@brief	以时间为基础生成一个当前时间的字符串,例如：20130201；
 *
 *	@return	返回当前时间的字符串。
 */
+ (NSString *)PPGenerateTradeTime;

/**
 *	@brief	以时间为基础生成一个当前时间的字符串+5个随机的字符串,例如：ABCDE201302011034；
 *
 *	@return	返回当前时间的字符串+5个随机的字符串。
 */
+ (NSString *)PPGenerateTradeTimeStr;


/**
 *  把传入的字符串和和时间字符串一起生成一个新的字符串,如果传入的字符串不不足4位,这补0;
 *
 *  @param aStr 字符串
 *
 *  @return 返回当前时间的字符串+传入的字符串
 */
+(NSString *)PPGetOrderNO:(NSString *)aStr;

/**
 *  获取当前时间的字符串
 *
 *  @return 返回一个时间的字符串
 */
+(NSString *)PPGetNowTime;

/**
 *  查看本机的型号
 *
 *  @return 把得到的型号返回;
 */
+(NSString *)PPMachineName;

@end