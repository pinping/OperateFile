//
//  PPTime.h
//  MacCamera
//
//  Created by pinping on 13-3-11.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPTime : NSObject

/**
 *	@brief	当调用此方法，返回一个现在几点钟的字符串。
 *
 *	@return	返回一个现在几点钟的字符串
 */
+ (NSString *)PPTimeHour;


/**
 *	@brief	当调用此方法的时候，需要传入一个yyyyMMdd类型的字符串。例如:20130201。然后就返回一个几月的字符串。
 *
 *  @param	monthNumber yyyyMMdd类型的字符串。例如:20130201
 *
 *	@return	返回一个几月的字符串
 */
+ (NSString *)PPTimeMonth;
+ (NSString *)PPTimeMonth:(NSString *)atime;

/**
 *	@brief	当调用此方法的时候，需要传入一个yyyyMMdd类型的字符串。例如:20130201。然后就返回一个星期几的字符串。
 *
 *  @param	timeStr yyyyMMdd类型的字符串。例如:20130201
 *
 *	@return	返回一个星期几的字符串
 */
+ (NSString *)PPTimeWeek;
+ (NSString *)PPTimeWeek:(NSString *)atime;


/**
 *	@brief	当调用此方法的时候，需要传入一个yyyyMMdd类型的字符串。例如:20130201。然后就返回这个月第多少天。
 *
 *  @param	timeStr yyyyMMdd类型的字符串。例如:20130201
 *
 *	@return	返回这个月第多少天
 */
+ (NSString *)PPTimeDay;
+ (NSString *)PPTimeDay:(NSString *)atime;


/**
 *	@brief	当调用此方法的时候，需要传入一个yyyyMMdd类型的字符串。例如:20130201。然后就返回这个月第一天星期几的字符串。
 *
 *  @param	timeStr yyyyMMdd类型的字符串。例如:201302
 *
 *	@return	返回这个月第一天星期几
 */
+ (NSString *)PPTimeMonthWeek;
+ (NSString *)PPTimeMonthWeek:(NSString *)atime;



/**
 *  传入一个 "2014-05-20 11:00:00 +0000"的时间数据,返回距离现在还有多少时间
 *
 *  @param theDate 一个时间类型的数据
 *
 *  @return 返回一个 天 小时 分钟
 */
+ (NSString *)PPIntervalToNow:(NSDate *) theDate;




+(NSString *)getNowTime;

+(NSString *)gettimeCha:(NSString *)time;

+ (NSString*)convertDateFormatter:(NSString*)sourceFormatter
									targetFormatter:(NSString*)targetFormatter
											 dateString:(NSString*)dateString;

+ (NSString *)PPSetTimeInt:(NSTimeInterval)timeSeconds setTimeFormat:(NSString *)timeFormatStr setTimeZome:(NSString *)timeZoneStr;

@end