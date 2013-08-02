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
 *	@brief	当调用此方法，返回一个现在几点钟的字符串。
 *
 *	@return	返回一个现在几点钟的字符串
 */
+ (NSString *)PPTimeHour
{
    NSDate              *now = [NSDate date];
    NSCalendar          *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents    *comps = [[NSDateComponents alloc] init];
    NSInteger           unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
        NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;

    comps = [calendar components:unitFlags fromDate:now];
    int         week = [comps hour];
    NSString    *weekDay;
    weekDay = [NSString stringWithFormat:@"%d", week];

//    [calendar release];
//    [comps release];
    return weekDay;
}

/**
 *	@brief	当调用此方法的时候，需要传入一个yyyyMMdd类型的字符串。例如:20130201。然后就返回一个几月的字符串。
 *
 *  @param	monthNumber yyyyMMdd类型的字符串。例如:20130201
 *
 *	@return	返回一个几月的字符串
 */
+ (NSString *)PPTimeMonth:(NSString *)atime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone      *timeZone = [NSTimeZone localTimeZone];

    [formatter setTimeZone:timeZone];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString        *stringTime = atime;
    NSDate          *dateTime = [formatter dateFromString:stringTime];
    NSCalendar      *cal = [NSCalendar currentCalendar];
    unsigned int    unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
        NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents    *dd = [cal components:unitFlags fromDate:dateTime];
    int                 mon = [dd month];
    NSString            *monthDay;
    switch (mon) {
        case 1:
            monthDay = @"一月";
            break;

        case 2:
            monthDay = @"二月";
            break;

        case 3:
            monthDay = @"三月";
            break;

        case 4:
            monthDay = @"四月";
            break;

        case 5:
            monthDay = @"五月";
            break;

        case 6:
            monthDay = @"六月";
            break;

        case 7:
            monthDay = @"七月";
            break;

        case 8:
            monthDay = @"八月";
            break;

        case 9:
            monthDay = @"九月";
            break;

        case 10:
            monthDay = @"十月";
            break;

        case 11:
            monthDay = @"十一月";
            break;

        case 12:
            monthDay = @"十二月";
            break;

        default:
            break;
    }

//    [formatter release];
    return monthDay;
}

/**
 *	@brief	当调用此方法的时候，需要传入一个yyyyMMdd类型的字符串。例如:20130201。然后就返回一个星期几的字符串。
 *
 *  @param	timeStr yyyyMMdd类型的字符串。例如:20130201
 *
 *	@return	返回一个星期几的字符串
 */
+ (NSString *)PPTimeWeek:(NSString *)atime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone      *timeZone = [NSTimeZone localTimeZone];

    [formatter setTimeZone:timeZone];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    //    NSString *stringTime = timeStr;
    NSDate *dateTime = [formatter dateFromString:atime];

    NSCalendar          *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents    *comps = [[NSDateComponents alloc] init];
    NSInteger           unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
        NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:dateTime];
    int         week = [comps weekday];
    NSString    *weekDay;
    switch (week) {
        case 1:
            weekDay = @"星期日";
            break;

        case 2:
            weekDay = @"星期一";
            break;

        case 3:
            weekDay = @"星期二";
            break;

        case 4:
            weekDay = @"星期三";
            break;

        case 5:
            weekDay = @"星期四";
            break;

        case 6:
            weekDay = @"星期五";
            break;

        case 7:
            weekDay = @"星期六";
            break;

        default:
            break;
    }

//    [formatter release];
//    [calendar release];
//    [comps release];
    return weekDay;
}

+ (NSString *)PPTimeDay:(NSString *)atime
{
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    NSTimeZone      *timeZone = [NSTimeZone localTimeZone];

    [formatter setTimeZone:timeZone];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate      *dateTime = [formatter dateFromString:atime];

    NSCalendar          *calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    NSDateComponents    *comps = [[[NSDateComponents alloc] init] autorelease];
    NSInteger           unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
        NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:dateTime];
    int         week = [comps day];
    NSString    *weekDay;
    weekDay = [NSString stringWithFormat:@"%d", week];

//    [formatter release];
//    [calendar release];
    return weekDay;
}


+ (NSString *)PPSetTimeInt:(NSTimeInterval)timeSeconds setTimeFormat:(NSString *)timeFormatStr setTimeZome:(NSString *)timeZoneStr
{
    
    NSString *date_string;
    
    NSDate *time_str;
    if( timeSeconds>0){
        time_str =[NSDate dateWithTimeIntervalSince1970:timeSeconds];
    }else{
        time_str=[[NSDate alloc] init];
    }
    
    if( timeFormatStr==nil){
        date_string =[NSString stringWithFormat:@"%ld",(long)[time_str timeIntervalSince1970]];
    }else{
        NSDateFormatter *date_format_str =[[[NSDateFormatter alloc] init] autorelease];
        [date_format_str setDateFormat:timeFormatStr];
        if( timeZoneStr!=nil){
            [date_format_str setTimeZone:[NSTimeZone timeZoneWithName:timeZoneStr]];
        }
        date_string =[date_format_str stringFromDate:time_str];
    }
    
    return date_string;
}



@end