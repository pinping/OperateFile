//
//  PPTime.m
//  MacCamera
//
//  Created by pinping on 13-3-11.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import "PPTime.h"

@implementation PPTime


/**
 *	@brief	当调用此方法的时候，需要传入一个yyyyMMdd类型的字符串。例如:20130201。然后就返回一个星期几的字符串。
 *
 *  @param	timeStr yyyyMMdd类型的字符串。例如:20130201
 *
 *	@return	返回一个星期几的字符串
 */
+ (NSString *) timeWeek:(NSString *) timeStr {
    
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat : @"yyyyMMdd"];
//    NSString *stringTime = timeStr;
    NSDate *dateTime = [formatter dateFromString:timeStr];
    
    NSCalendar *calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    NSDateComponents *comps = [[[NSDateComponents alloc] init] autorelease];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:dateTime];
    int week = [comps weekday];
    NSString  *weekDay;
    switch (week) {
        case 1:
            weekDay=@"星期日";
            break;
        case 2:
            weekDay=@"星期一";
            break;
        case 3:
            weekDay=@"星期二";
            break;
        case 4:
            weekDay=@"星期三";
            break;
        case 5:
            weekDay=@"星期四";
            break;
        case 6:
            weekDay=@"星期五";
            break;
        case 7:
            weekDay=@"星期六";
            break;
        default:
            break;
    }
    return weekDay;
}

@end
